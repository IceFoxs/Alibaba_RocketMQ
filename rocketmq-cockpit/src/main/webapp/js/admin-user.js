$(document).ready(function() {
    $.get("cockpit/manage/user/all", function(data) {
        data.forEach(function(item) {
            var $tr = $("<tr></tr>");
            $tr.append($("<td></td>").text(item.team.name))
               .append($("<td></td>").text(item.username))
               .append($("<td></td>").text(item.email))
               .append($("<td></td>").text(item.status));
            var $operationTd = $("<td></td>");
            var $a = $("<a href='javascript:;' class='operation'></a>");
            $a.attr("rel", item.id);
            if (item.status == "ACTIVE") {
                $a.addClass("active");
                $a.text("Suspend");
            } else if (item.status == "DRAFT") {
                $a.addClass("draft");
                $a.text("Activate");
            } else if (item.status == "DELETED") {
                $a.addClass("deleted");
                $a.text("Activate");
            }
            $operationTd.append($a);
            $tr.append($operationTd);

            var $roleTd = $("<td></td>");
            var first = true;
            item.cockpitRoles.forEach(function(role) {
                if (first) {
                    $roleTd.append($("<span class='role_first'></span>").text(role.name));
                    first = false;
                } else {
                    $roleTd.append($("<span class='role'></span>").text(role.name));
                }
            });
            $tr.append($roleTd);

            $("#userList").append($tr);
        });
    });

    $(".operation").live("click", function() {
        var $a = $(this);
        var userId = $a.attr("rel");
        if ($a.hasClass("draft") || $a.hasClass("deleted")) {
            $.get("cockpit/manage/user/activate/" + userId, function(data) {
                $a.parent().prev().text(data.status);
                $a.addClass("active");
                $a.removeClass("draft");
                $a.removeClass("deleted");
                $a.text("Suspend");
            });
        } else if ($a.hasClass("active")) {
            $.get("cockpit/manage/user/suspend/" + userId, function(data) {
                $a.parent().prev().text(data.status);
                $a.addClass("deleted");
                $a.removeClass("active");
                $a.text("Activate");
            });
        }
    });

});