/*global
    piranha
*/
piranha.userlogin = new Vue({
    el: "#userlogin",
    data: {
        loading: true,
        siteId: null,
        siteTitle: null,
        sites: [],
        items: [],
        model: {
            id: null,
            userName: null,
            userPassWord: null,
            userPhone: null,
            userFacebook: null,
            userCare: null,
            userEmail : null,
        }
    },
    methods: {
        load: function (siteId) {
            var self = this;

            if (!siteId) {
                siteId = "";
            }

            fetch(piranha.baseUrl + "manager/api/userlogin/list/" + siteId)
                .then(function (response) { return response.json(); })
                .then(function (result) {
                    self.siteId = result.siteId;
                    self.siteTitle = result.siteTitle;
                    self.sites = result.sites;
                    self.items = result.items;
                })
                .catch(function (error) { console.log("error:", error); });
        },
        save: function () {
            // Validate form
            var form = document.getElementById("userloginForm");
            if (form.checkValidity() === false) {
                form.classList.add("was-validated");
                return;
            }

            fetch(piranha.baseUrl + "manager/api/userlogin/save", {
                method: "post",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    id: piranha.userlogin.model.id,
                    siteId: piranha.userlogin.siteId,
                    userName: piranha.userlogin.userName,
                    userPassWord: piranha.userlogin.model.userPassWord,
                    userPhone: piranha.userlogin.model.userPhone,
                    userFacebook: piranha.userlogin.model.userFacebook,
                    userCare: piranha.userlogin.model.userCare,
                    userEmail: piranha.userlogin.model.userEmail,
                })
            })
                .then(function (response) { return response.json(); })
                .then(function (result) {
                    if (result.status.type === "success") {
                        // Remove validation class
                        form.classList.remove("was-validated");

                        // Close modal
                        $("#userloginModal").modal("hide");

                        // Clear modal
                        piranha.userlogin.model.id = null;
                        piranha.userlogin.model.userName = null;
                        piranha.userlogin.model.userPassWord = null;
                        piranha.userlogin.model.userPhone = null;
                        piranha.userlogin.model.userFacebook = null;
                        piranha.userlogin.model.userCare = null;
                        piranha.userlogin.model.userEmail = null;

                        piranha.userlogin.items = result.items;
                    }

                    // Push status to notification hub
                    piranha.notifications.push(result.status);
                })
                .catch(function (error) {
                    console.log("error:", error);
                });
        },
        remove: function (id) {
            var self = this;

            piranha.alert.open({
                title: piranha.resources.texts.delete,
                body: piranha.resources.texts.deleteUserLoginConfirm,
                confirmCss: "btn-danger",
                confirmIcon: "fas fa-trash",
                confirmText: piranha.resources.texts.delete,
                onConfirm: function () {
                    fetch(piranha.baseUrl + "manager/api/userlogin/delete/" + id)
                        .then(function (response) { return response.json(); })
                        .then(function (result) {
                            self.items = result.items;

                            // Push status to notification hub
                            piranha.notifications.push(result.status);
                        })
                        .catch(function (error) { console.log("error:", error); });
                }
            });
        }
    },
    updated: function () {
        this.loading = false;
    }
});

$(document).on("shown.bs.modal", "#userloginModal", function (event) {
    $(this).find("#userName").focus();
});