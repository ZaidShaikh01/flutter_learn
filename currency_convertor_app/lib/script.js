let students = [];

function addStudent() {
    let name = document.getElementById("name").value.trim();
    let age = document.getElementById("age").value.trim();
    let error = document.getElementById("error");
    
    if (!name || !age) {
        error.textContent = "All fields are required";
        return;
    }
    
    error.textContent = "";
    students.push({ name, age });
    document.getElementById("name").value = "";
    document.getElementById("age").value = "";
    displayStudents();
}

function displayStudents() {
    let list = document.getElementById("student-list");
    list.innerHTML = "";
    students.forEach((student, index) => {
        list.innerHTML += `<tr>
            <td>${student.name}</td>
            <td>${student.age}</td>
            <td>
                <button onclick="editStudent(${index})">Edit</button>
                <button onclick="deleteStudent(${index})">Delete</button>
            </td>
        </tr>`;
    });
}

function deleteStudent(index) {
    students.splice(index, 1);
    displayStudents();
}

function editStudent(index) {
    let newName = prompt("Enter new name:", students[index].name);
    let newAge = prompt("Enter new age:", students[index].age);
    if (newName && newAge) {
        students[index] = { name: newName, age: newAge };
        displayStudents();
    }
}

function sortTable(column) {
    students.sort((a, b) => {
        if (column === 0) return a.name.localeCompare(b.name);
        if (column === 1) return a.age - b.age;
    });
    displayStudents();
}
