import { LightningElement,track} from 'lwc';

export default class ToDoApplication extends LightningElement
{
    @track taskName = '';
    @track taskDate = '';
    @track taskList = [];
    @track errorMessage = '';

    handleTaskNameChange(event) {
        this.taskName = event.target.value;
    }

    handleTaskDateChange(event) {
        this.taskDate = event.target.value;
    }

    handleCreateTask() {
        this.errorMessage = '';

        if (!this.taskName) {
            this.errorMessage = 'Task name is required.';
            return;
        }

        if (this.isDuplicateTask(this.taskName)) {
            this.errorMessage = 'Task name must be unique.';
            return;
        }

        if (!this.taskDate) {
            const today = new Date();
            this.taskDate = today.toISOString().split('T')[0];
        }

        this.taskList = [...this.taskList, { id: this.taskList.length + 1, name: this.taskName, date: this.taskDate }];
        this.handleReset();
    }

    handleReset() {
        this.taskName = '';
        this.taskDate = '';
        this.errorMessage = '';
    }

    isDuplicateTask(name) {
        return this.taskList.some(task => task.name === name);
    }

}