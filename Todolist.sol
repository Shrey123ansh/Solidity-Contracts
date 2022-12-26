// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Todolist{
    uint256 public taskCount=0;
    struct Task{
        uint256 id;
        string content;
        bool completed;
    }

    event TaskCreated(uint256 id,string content,bool completed);
    event TaskCompleted(uint256 id,bool completed);
    event TaskEdited(uint256 id,string content);


    mapping(uint=>Task) public tasks;

    constructor()  {
        createTask("My first Todo");
    }

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount,_content,false);
        emit TaskCreated(taskCount,_content,false);
    }

    function toggleCompleted(uint256 _id) public{
        Task memory _task = tasks[_id];
        _task.completed=!_task.completed;
        tasks[_id]=_task;
        emit TaskCompleted(_id,_task.completed);
    }
    function editTask(uint256 _id,string memory _content)public {
        Task memory _task = tasks[_id];
        _task.content=_content;
        tasks[_id]= _task;
        emit TaskEdited(_id,_task.content);
    }
}
