class Schedule {
  String startTime;
  String endTime;  
  
  Schedule(this.startTime, this.endTime);
  
  scheduleToJson() {
    return {
      "start": startTime,
      "end": endTime,
    };
  }

}
