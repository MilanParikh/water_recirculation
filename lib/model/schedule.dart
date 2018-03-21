class Schedule {
  int startHour;
  int startMinute;
  int endHour;
  int endMinute;

  
  Schedule(this.startHour, this.startMinute, this.endHour, this.endMinute);
  
  scheduleToJson() {
    return {
      "startHour": startHour,
      "startMinute": startMinute,
      "endHour": endHour,
      "endMinute": endMinute,
    };
  }

}
