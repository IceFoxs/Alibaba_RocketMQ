<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consumer Management</title>
    <%@include file="../include/base-path.jsp"%>
    <base href="<%=basePath%>%">
    <link rel="shortcut icon" href="favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://libs.baidu.com/jquery/1.7.0/jquery.js"></script>
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <script src="js/consumer.js" type="application/javascript"></script>
</head>
<body>
    <div class="container-fluid">
                <div class="col-xs-7 col-xs-offset-2">
                    <input type="text" class="form-control groupName" placeholder="Find Consumers By Group Name">
                </div>
                <div class="col-xs-2">
                    <button type="submit" class="btn btn-primary findConsumers">find</button>
                </div>

        <div class="row">
            <div class="col-md-8 col-md-offset-2 text-center">
                <h1>Producer Catalog</h1>
            </div>
        </div>

        <div class="clear-both"></div>

        <div class="row">
            <div class="col-xs-8 col-xs-offset-2 text-left table-responsive">
                <table class="table table-condense table-hover table-bordered">
                    <thead>
                        <tr>
                            <td>Consumer ID</td>
                            <td>Consumer IP</td>
                        </tr>
                    </thead>
                    <tbody class="table-striped table-content">
                    </tbody>
                </table>

                <div class="clear-both"></div>

            </div>


        </div>
    </div>
</body>
</html>
