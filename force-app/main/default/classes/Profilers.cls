public with sharing class Profilers
{
    public class SerializationProfiler extends LimitsProfiler
    {
        final List<String> data;
        public SerializationProfiler()
        {
            data = new List<String>();
            for (Integer i = 0; i < 1000; i++) {
                data.add('a'.repeat(1000));
            }
        }
        public override void execute()
        {
            String payload = JSON.serialize(data);
        }
    }

    public class InsertProfiler extends LimitsProfiler
    {
        final List<Account> aList;
        public InsertProfiler() 
        {
            List<String> ratingList = new List<String> {'Hot', 'Warm', 'Cold', null};
            aList = new List<Account>();
            for (Integer i = 0; i < 200; i++) {
                aList.add(new Account(Name = 'Test' + i, Rating = ratingList[Math.mod(i, 4)], AccountSource = 'Web'));
            }
        }
        public override void execute()
        {
            List<Account> aListCopy = aList.deepClone(false, false, false);
            insert aListCopy;
        }
    }
}