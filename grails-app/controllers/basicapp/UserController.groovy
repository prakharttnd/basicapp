package basicapp

import basicapp.co.SearchCO
import basicapp.vo.UserVO
import grails.converters.JSON

class UserController {

    def index() {

    }

    def save() {
        User user = new User(params)
        if (user.save(flush: true)) {
            flash.message = "User added Successfully!!"
        } else {
            flash.error = "Error adding User!!"
        }
        redirect(action: 'add')
    }

    def add() {
    }

    def list() {
        List<User> userList = User.findAll();
        render view: 'list', model: [userList: userList]
    }

    def delete() {
        long id = params.long("id")
        User user = User.load(id)
        if (!user.delete(flush: true)) {
            flash.message = "User deleted Successfully!!"
        } else {
            flash.error = "Error deleting User!!"
        }
        redirect(action: 'listAll')
    }

    def update() {
        long id = params.long("id")
        User user = User.get(id)
        render view: 'update', model: [user: user]
    }

    def updateRecord() {
        long id = params.long("id")
        User user = User.get(id)
        bindData(user, params, [exclude: ['password']])
        if (params.password) {
            user.password = params.password
        }
        if (user.save(flush: true)) {
            flash.message = "Updated Successfully!!"
        } else {
            flash.error = "Error in update!!"
        }
        redirect(action: 'listAll')
    }

    def fetchUsers(SearchCO searchCO) {
        println "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>"
        println params
        println "<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>"
        searchCO.max = params.length ? params.int("length") : 10
        searchCO.offset = params.start ? params.int("start") : 0
        List<User> userList = User.search(searchCO).list(max: searchCO.max, offset: searchCO.offset, order: searchCO.order, sort: searchCO.order)
        List<UserVO> users = userList.collect {
            new UserVO(firstName: it.firstName, lastName: it.lastName, email: it.email, id: it.id)
        }
        render(["data": users, "recordsTotal": User.count(), "recordsFiltered": User.count()] as JSON)
    }

    def listAll() {

    }
}
