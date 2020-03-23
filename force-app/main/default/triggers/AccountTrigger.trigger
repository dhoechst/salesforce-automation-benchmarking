trigger AccountTrigger on Account(before insert, before update) {
  for (Account a : Trigger.new) {
    if (
      Trigger.isInsert ||
      (Trigger.isUpdate && a.Rating != Trigger.oldMap.get(a.Id).Rating)
    ) {
      switch on a.Rating {
        when 'Hot' {
          a.NumberOfEmployees = 100;
        }
        when 'Warm' {
          a.NumberOfEmployees = 200;
        }
        when 'Cold' {
          a.NumberOfEmployees = 300;
        }
      }
    }
  }
}