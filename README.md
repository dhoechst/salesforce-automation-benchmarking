# salesforce-automation-benchmarking
Collection of different automation implementations that can be used to benchmark performance

### Setup:
1. Working setup of SFDX
2. Clone this repository to your computer
3. Create a new scratch org
4. Install [Limits Profiler](https://github.com/apexlarson/LimitsProfiler) into scratch org `sfdx force:package:install --package 04t41000002RXGo`
5. Push the components to the org `sfdx force:source:push` 

### Testing:
1. Determine which scenario you'd like to test and make sure all other automations are deactivated.
2. Navigate to `/apex/LimitsProfiler` in the org.
3. Click `Configure` and set the Profiler Type to `Profilers.InsertProfiler` and iterations to `1`. Check any of the limits you are interested in seeing. Save the Config.
4. Click `Measure`. This will insert 200 accounts. The insert will use 1 DML Statement and 200 DML Rows. The remaining things  are done by the automation type selected.
5. Optionally, you can click `Save` to save the profiling to a custom object called Limits Snapshots.
