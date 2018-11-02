<%-- 
    Document   : note
    Created on : Nov 1, 2018, 6:48:26 PM
    Author     : 759388
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notes</title>
    </head>
    <body>
      <h1>Notes!</h1>
        <c:choose>
            <c:when test="${selectedNote == null}">
                <table>
                    <tr>
                        <th>Note ID</th>
                        <th>Date Created</th>
                        <th>Contents</th>
                    </tr>
                    <c:forEach var="note" items="${notes}" >
                        <tr>
                            <form action="note?delete" method="POST" >
                                    <td>${note.noteid}</td>
                                    <td>${note.dateCreated}</td>
                                    <td>${note.contents}</td>
                                    <td><button type="submit" name="noteToDelete" value="${note.noteid}">Delete</button></td>
                            </form>
                            <form action="note?edit" method="POST">
                                <td><button type="submit" name="noteToEdit" value="${note.noteid}">Edit</button></td>
                            </form>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:when test="${selectedNote != null}">
                <form action="note?save" method="POST" >
                    <input type="hidden" name="upNoteId" value="${selectedNote.noteid}" >
                    <textarea name="upNoteBody" rows="5" columns="50">
                        ${selectedNote.contents}
                    </textarea>
                    <input type="submit" value="save">
                </form>
            </c:when>
        </c:choose>
        
        <h1>Add Note</h1>
        <form action="note?add" method="POST">
            <textarea name="newNoteBody" rows="5" columns="50">
                
            </textarea>
            <input type="submit" value="add">
        </form>
    </body>
</html>
