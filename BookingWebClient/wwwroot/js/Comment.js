$(() => {

    LoadCommentsData();

    var connection = new signalR.HubConnectionBuilder().withUrl("/signalrServer").build();

    connection.start();

    connection.on("LoadComments", function () {
        LoadCommentsData();
    })


    LoadCommentsData();


    function LoadCommentsData() {
        var tr = '';
        console.log("bbbbbbbbbbbbbbbbxxxxxx");
        $.ajax({
            url: '/Comment/GetComments',
            method: 'GET',
            success: (result) => {
                $.each(result, (k, v) => {
                    if (v.rate == 5) {
                        tr += `<br/>
                        <div class="d-flex flex-row comment-row">
                            <div class="p-2">
                                <span class="round"><img src="/images/user.jpg" alt="user" width="50"></span>
                            </div>
                            <div class="comment-text w-100">
                                <h5 style="text-size-adjust">${v.idaccNavigation.fullName}</h5>
                                <div class="comment-footer">
                                        <div class="start">
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                        </div>
                                </div>
                                <p class="m-b-5 m-t-10">${v.description}</p>
                            </div>
                        </div>`
                    }
                    else if (v.rate == 4) {
                        tr += `<br/>
                        <div class="d-flex flex-row comment-row">
                            <div class="p-2">
                                <span class="round"><img src="/images/user.jpg" alt="user" width="50"></span>
                            </div>
                            <div class="comment-text w-100">
                                <h5 style="text-size-adjust">${v.idaccNavigation.fullName}</h5>
                                <div class="comment-footer">
                                      <div class="start">
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                        </div>
                                </div>
                                <p class="m-b-5 m-t-10">${v.description}</p>
                            </div>
                        </div>`
                    }
                    else if (v.rate == 3) {
                        tr += `<br/>
                        <div class="d-flex flex-row comment-row">
                            <div class="p-2">
                                <span class="round"><img src="/images/user.jpg" alt="user" width="50"></span>
                            </div>
                            <div class="comment-text w-100">
                                <h5 style="text-size-adjust">${v.idaccNavigation.fullName}</h5>
                                <div class="comment-footer">
                                       <div class="start">
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                        </div>
                                </div>
                                <p class="m-b-5 m-t-10">${v.description}</p>
                            </div>
                        </div>`
                    }
                    else if (v.rate == 2) {
                        tr += `<br/>
                        <div class="d-flex flex-row comment-row">
                            <div class="p-2">
                                <span class="round"><img src="/images/user.jpg" alt="user" width="50"></span>
                            </div>
                            <div class="comment-text w-100">
                                <h5 style="text-size-adjust">${v.idaccNavigation.fullName}</h5>
                                <div class="comment-footer">
                                      <div class="start">
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                        </div>
                                </div>
                                <p class="m-b-5 m-t-10">${v.description}</p>
                            </div>
                        </div>`
                    }
                    else if (v.rate == 1) {
                        tr += `<br/>
                        <div class="d-flex flex-row comment-row">
                            <div class="p-2">
                                <span class="round"><img src="/images/user.jpg" alt="user" width="50"></span>
                            </div>
                            <div class="comment-text w-100">
                                <h5 style="text-size-adjust">${v.idaccNavigation.fullName}</h5>
                                <div class="comment-footer">
                                       <div class="start">
                                            <img src="/images/start_fill.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                        </div>
                                </div>
                                <p class="m-b-5 m-t-10">${v.description}</p>
                            </div>
                        </div>`
                    } else {
                        tr += `<br/>
                        <div class="d-flex flex-row comment-row">
                            <div class="p-2">
                                <span class="round"><img src="/images/user.jpg" alt="user" width="50"></span>
                            </div>
                            <div class="comment-text w-100">
                                <h5 style="text-size-adjust">${v.idaccNavigation.fullName}</h5>
                                <div class="comment-footer">
                                      <div class="start">
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                            <img src="/images/start_empty.png" asp-append-version="true" />
                                        </div>
                                </div>
                                <p class="m-b-5 m-t-10">${v.description}</p>
                            </div>
                        </div>`
                    }
                })
                $("#tableComments").html(tr);
            },
            error: (error) => {
                console.log("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")
            }
        });
    }
})