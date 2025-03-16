function New-MBSPlanSchedule {
    <#
    .SYNOPSIS
    Returs MBS.Agent.Plan.Schedule object.
    
    .DESCRIPTION
    Creates MBS backup plan schedule object. 
    
    .PARAMETER Once
    Run once
    
    .PARAMETER Daily
    Run either daily at specific time or daily from/till specific time every specific min/hour
    
    .PARAMETER Weekly
    Run weekly at specific time or weekly from/till specific time every specific min/hour
    
    .PARAMETER Monthly
    Run monthly at specific time or monthly from/till specific time every specific min/hour
    
    .PARAMETER Realtime
    Run real-time
    
    .PARAMETER At
    Specify either datetime or time of schedule
    
    .PARAMETER DayOfMonth
    Specify day for 'dayofmonth' schedule (1..31)
    
    .PARAMETER DayOfWeek
    Specify day(s) of week for weekly schedule or day of week for monthly schedule. Possible values: Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
    
    .PARAMETER WeekNumber
    Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last
    
    .PARAMETER OccursFrom
    Specify daily recurring from value
    
    .PARAMETER OccursTo
    Specify daily recurring till value
    
    .PARAMETER OccursEvery
    Specify recurring period value. Possible values: 1-59 min, or 1-180 hour
    
    .PARAMETER RepeatInterval
    Specify repeat period value (days). Possible values: 1..31
    
    .PARAMETER RepeatStartDate
    Specify start date of repetitions
    
    .EXAMPLE
    New-MBSPlanSchedule -Once -At 10:00
    
    Run once at 10:00 

    .EXAMPLE
    New-MBSPlanSchedule -Daily -At 10:00
    
    Run daily at 10:00 

    .EXAMPLE
    New-MBSPlanSchedule -Daily -At 10:00 -RepeatInterval 2 -RepeatStartDate (Get-Date)
    
    Run every two days at 10:00 from today. 

    .EXAMPLE
    New-MBSPlanSchedule -Weekly -At "06:00 PM" -DayOfWeek Friday -RepeatInterval 1 -RepeatStartDate (Get-Date)
    
    Run every Friday at 6 PM from today. 

    .EXAMPLE
    New-MBSPlanSchedule -Monthly -At "18:00" -DayOfMonth 3 -RepeatInterval 3 -RepeatStartDate ((Get-Date)+2.)
    
    Run every third month on trird day at 6 PM from today + 2 days.

    .EXAMPLE
    New-MBSPlanSchedule -Realtime
    
    Run real-time.

    .INPUTS
        None.

    .OUTPUTS
        MBS.Agent.Plan.BackupPlanCommonOption

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/new-mbsplanschedule
    #>

    [CmdletBinding()]
    param (
        ##
        [Parameter(Mandatory=$False, HelpMessage="Run once", ParameterSetName='Once')]
        [switch]
        $Once,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Run daily at specific time", ParameterSetName='DailyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Run daily from/till specific time every specific min/hour", ParameterSetName='DailyEvery')]
        [switch]
        $Daily,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Run weekly at specific time", ParameterSetName='WeeklyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Run weekly from/till specific time every specific min/hour", ParameterSetName='WeeklyEvery')]
        [switch]
        $Weekly,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Run monthly at specific time", ParameterSetName='MonthlyDayAt')]
        [Parameter(Mandatory=$False, HelpMessage="Run monthly from/till specific time every specific min/hour", ParameterSetName='MonthlyDayEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Run monthly at specific time", ParameterSetName='MonthlyWeekAt')]
        [Parameter(Mandatory=$False, HelpMessage="Run monthly from/till specific time every specific min/hour", ParameterSetName='MonthlyWeekEvery')]
        [switch]
        $Monthly,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Run real-time", ParameterSetName='Realtime')]
        [switch]
        $Realtime,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Specify datetime. Example -at ""06/09/19 7:43 AM""", ParameterSetName='Once')]
        [Parameter(Mandatory=$False, HelpMessage="Specify time of schedule. Example -at ""7:43 AM""", ParameterSetName='DailyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify time of schedule. Example -at ""7:43 AM""", ParameterSetName='WeeklyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify time of schedule. Example -at ""7:43 AM""", ParameterSetName='MonthlyWeekAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify time of schedule. Example -at ""7:43 AM""", ParameterSetName='MonthlyDayAt')]
        [datetime]
        $At,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Specify day for 'dayofmonth' schedule (1..31)", ParameterSetName='MonthlyDayAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day for 'dayofmonth' schedule (1..31)", ParameterSetName='MonthlyDayEvery')]
        [Int32][ValidateRange(1,31)]
        $DayOfMonth,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Specify day(s) of week for weekly schedule. Example: ""Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday""", ParameterSetName='WeeklyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day(s) of week for weekly schedule. Example: ""Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday""", ParameterSetName='WeeklyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day of week for monthly schedule. Example: ""Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday""", ParameterSetName='MonthlyWeekAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day of week for monthly schedule. Example: ""Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday""", ParameterSetName='MonthlyWeekEvery')]
        #[ValidateSet("su", "mo", "tu", "we", "th", "fr", "sa")]
        [System.DayOfWeek[]]
        $DayOfWeek,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last", ParameterSetName='MonthlyWeekAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last", ParameterSetName='MonthlyWeekEvery')]
        [ValidateSet("First", "Second", "Third", "Fourth", "Penultimate", "Last")]
        [MBS.Agent.Plan.WeekNumber]
        $WeekNumber,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring from value", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring from value", ParameterSetName='WeeklyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring from value", ParameterSetName='MonthlyWeekEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring from value", ParameterSetName='MonthlyDayEvery')]
        [ValidatePattern("^([01]?[0-9]|2[0-3]):[0-5][0-9]:[0][0]$")]
        [timespan]
        $OccursFrom,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring till value", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring till value", ParameterSetName='WeeklyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring till value", ParameterSetName='MonthlyWeekEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring till value", ParameterSetName='MonthlyDayEvery')]
        [ValidatePattern("^([01]?[0-9]|2[0-3]):[0-5][0-9]:[0][0]$")]
        [timespan]
        $OccursTo,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Specify recurring period value. Possible values: 1-59 min, or 1-180 hour", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify recurring period value. Possible values: 1-59 min, or 1-180 hour", ParameterSetName='WeeklyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify recurring period value. Possible values: 1-59 min, or 1-180 hour", ParameterSetName='MonthlyWeekEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify recurring period value. Possible values: 1-59 min, or 1-180 hour", ParameterSetName='MonthlyDayEvery')]
        #[ValidatePattern("\b([1-9]|[1-4][0-9]|5[0-9]) min\b|\b([1-9]|[1-8][0-9]|9[0-9]|1[0-7][0-9]|180) hour\b")]
        [timespan]
        $OccursEvery,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (days). Possible values: 1..31", ParameterSetName='DailyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (days). Possible values: 1..31", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (weeks). Possible values: 1..31", ParameterSetName='WeeklyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (weeks). Possible values: 1..31", ParameterSetName='WeeklyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (months). Possible values: 1..31", ParameterSetName='MonthlyWeekAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (months). Possible values: 1..31", ParameterSetName='MonthlyWeekEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (months). Possible values: 1..31", ParameterSetName='MonthlyDayAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (months). Possible values: 1..31", ParameterSetName='MonthlyDayEvery')]
        [Int32][ValidateRange(1,31)]
        $RepeatInterval,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='DailyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='WeeklyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='WeeklyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='MonthlyWeekAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='MonthlyWeekEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='MonthlyDayAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='MonthlyDayEvery')]
        #[Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='Yearly')]
        [DateTime]
        $RepeatStartDate
    )
    
    begin {
        
    }
    
    process {
        $Schedule = New-Object -TypeName MBS.Agent.Plan.Schedule
        if($Once){$Schedule.Frequency = 'Once'}
        if($Daily){$Schedule.Frequency = 'Daily'}
        if($Weekly){$Schedule.Frequency = 'Weekly'}
        if($Monthly -and -not $DayOfMonth){$Schedule.Frequency = 'Monthly'}
        if($Monthly -and $DayOfMonth){$Schedule.Frequency = 'DayofMonth'}
        if($Realtime){$Schedule.Frequency = 'Realtime'}
        if($At){$Schedule.At = $At}
        if($DayOfMonth){$Schedule.DayOfMonth = $DayOfMonth}
        if($Null -ne $DayOfWeek){$Schedule.DayOfWeek = $DayOfWeek}
        if($null -ne $WeekNumber){$Schedule.WeekNumber = $WeekNumber}
        if($OccursFrom){$Schedule.OccursFrom = $OccursFrom}
        if($OccursTo){$Schedule.OccursTo = $OccursTo}
        if($OccursEvery){$Schedule.OccursEvery = $OccursEvery}
        if($RepeatInterval){$Schedule.RepeatInterval = $RepeatInterval}
        if($RepeatStartDate){$Schedule.RepeatStartDate = $RepeatStartDate}

        return $Schedule
    }
    
    end {
        
    }
}
# SIG # Begin signature block
