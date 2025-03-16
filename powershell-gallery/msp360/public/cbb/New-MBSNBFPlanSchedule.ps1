function New-MBSNBFPlanSchedule {
    <#
    .SYNOPSIS
    Returs MBS.Agent.Plan.NBFFullSchedule or MBS.Agent.Plan.NBFIncrementalSchedule object.
    
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
    
    .PARAMETER At
    Specify either datetime or time of schedule
    
    .PARAMETER DayOfMonth
    Specify day for 'dayofmonth' schedule (1..31)
    
    .PARAMETER DayOfWeek
    Specify day(s) of week for weekly schedule or day of week for monthly schedule. Possible values: First, Second, Third, Fourth, Penultimate, Last
    
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
    New-MBSNBFPlanSchedule -Incremental -Once -At 10:00
    
    Run incremental (or first full) backup once at 10:00.

    .EXAMPLE
    New-MBSNBFPlanSchedule -Incremental -Daily -At 10:00
    
    Run daily incremental backup at 10:00.

    .EXAMPLE
    New-MBSNBFPlanSchedule -Incremental -Weekly -At "06:00 PM" -DayOfWeek Friday
    
    Run incremental backup every Friday at 6 PM. 

    .EXAMPLE
    New-MBSNBFPlanSchedule -Incremental -Monthly -At "18:00" -DayOfMonth 3
    
    Run incremental backup every month on the third day at 6 PM.

    .EXAMPLE
    New-MBSNBFPlanSchedule -Full -Daily
    
    Run full backup daily.

    .EXAMPLE
    New-MBSNBFPlanSchedule -Full -Weekly -DayOfWeek Friday
    
    Run full backup every Friday. 

    .EXAMPLE
    New-MBSNBFPlanSchedule -Full -Monthly -DayOfMonth 3
    
    Run full backup every month on the third day.

    .INPUTS
        None.

    .OUTPUTS
        MBS.Agent.Plan.NBFIncrementalSchedule
        MBS.Agent.Plan.NBFFullSchedule

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/new-mbsnbfplanschedule
    #>

    [CmdletBinding()]
    param (
        ##
        #[Parameter(Mandatory=$true, HelpMessage="Use to configure incremental backup schedule", ParameterSetName='Once')]
        [Parameter(Mandatory=$true, HelpMessage="Use to configure incremental backup schedule", ParameterSetName='DailyAt')]
        [Parameter(Mandatory=$true, HelpMessage="Use to configure incremental backup schedule", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$true, HelpMessage="Use to configure incremental backup schedule", ParameterSetName='WeeklyAt')]
        [Parameter(Mandatory=$true, HelpMessage="Use to configure incremental backup schedule", ParameterSetName='WeeklyEvery')]
        [Parameter(Mandatory=$true, HelpMessage="Use to configure incremental backup schedule", ParameterSetName='MonthlyDayAt')]
        [Parameter(Mandatory=$true, HelpMessage="Use to configure incremental backup schedule", ParameterSetName='MonthlyWeekAt')]
        [switch]
        $Incremental,
        ##
        [Parameter(Mandatory=$true, HelpMessage="Use to configure full backup schedule", ParameterSetName='DailyFull')]
        [Parameter(Mandatory=$true, HelpMessage="Use to configure full backup schedule", ParameterSetName='WeeklyFull')]
        [Parameter(Mandatory=$true, HelpMessage="Use to configure full backup schedule", ParameterSetName='MonthlyDayFull')]
        [Parameter(Mandatory=$true, HelpMessage="Use to configure full backup schedule", ParameterSetName='MonthlyWeekFull')]
        [switch]
        $Full,
        ##
        #[Parameter(Mandatory=$False, HelpMessage="Run once", ParameterSetName='Once')]
        #[switch]
        #$Once,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Run daily at specific time", ParameterSetName='DailyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Run daily from/till specific time every specific min/hour", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Run daily from/till specific time every specific min/hour", ParameterSetName='DailyFull')]
        [switch]
        $Daily,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Run weekly at specific time", ParameterSetName='WeeklyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Run weekly from/till specific time every specific min/hour", ParameterSetName='WeeklyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Run weekly from/till specific time every specific min/hour", ParameterSetName='WeeklyFull')]
        [switch]
        $Weekly,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Run monthly at specific time", ParameterSetName='MonthlyWeekAt')]
        [Parameter(Mandatory=$False, HelpMessage="Run monthly on specific weekday", ParameterSetName='MonthlyWeekFull')]
        [Parameter(Mandatory=$False, HelpMessage="Run monthly at specific time", ParameterSetName='MonthlyDayAt')]
        [Parameter(Mandatory=$False, HelpMessage="Run monthly on specific day", ParameterSetName='MonthlyDayFull')]
        [switch]
        $Monthly,
        ##
        #[Parameter(Mandatory=$true, HelpMessage="Specify datetime. Example -at ""06/09/19 7:43 AM""", ParameterSetName='Once')]
        [Parameter(Mandatory=$true, HelpMessage="Specify time of schedule. Example -at ""7:43 AM""", ParameterSetName='DailyAt')]
        [Parameter(Mandatory=$true, HelpMessage="Specify time of schedule. Example -at ""7:43 AM""", ParameterSetName='WeeklyAt')]
        [Parameter(Mandatory=$true, HelpMessage="Specify time of schedule. Example -at ""7:43 AM""", ParameterSetName='MonthlyWeekAt')]
        [Parameter(Mandatory=$true, HelpMessage="Specify time of schedule. Example -at ""7:43 AM""", ParameterSetName='MonthlyDayAt')]
        [datetime]
        $At,
        ##
        [Parameter(Mandatory=$true, HelpMessage="Specify day for 'dayofmonth' schedule (1..31)", ParameterSetName='MonthlyDayAt')]
        [Parameter(Mandatory=$true, HelpMessage="Specify day for 'dayofmonth' schedule (1..31)", ParameterSetName='MonthlyDayFull')]
        [Int32][ValidateRange(1,31)]
        $DayOfMonth,
        ##
        [Parameter(Mandatory=$true, HelpMessage="Specify day(s) of week for weekly schedule. Example: ""Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday""", ParameterSetName='WeeklyFull')]
        [Parameter(Mandatory=$true, HelpMessage="Specify day(s) of week for weekly schedule. Example: ""Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday""", ParameterSetName='WeeklyAt')]
        [Parameter(Mandatory=$true, HelpMessage="Specify day(s) of week for weekly schedule. Example: ""Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday""", ParameterSetName='WeeklyEvery')]
        [Parameter(Mandatory=$true, HelpMessage="Specify day of week for monthly schedule. Example: ""Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday""", ParameterSetName='MonthlyWeekFull')]
        [Parameter(Mandatory=$true, HelpMessage="Specify day of week for monthly schedule. Example: ""Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday""", ParameterSetName='MonthlyWeekAt')]
        [System.DayOfWeek[]]
        $DayOfWeek,
        ##
        [Parameter(Mandatory=$true, HelpMessage="Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last", ParameterSetName='MonthlyWeekAt')]
        [Parameter(Mandatory=$true, HelpMessage="Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last", ParameterSetName='MonthlyWeekFull')]
        [ValidateSet("First", "Second", "Third", "Fourth", "Penultimate", "Last")]
        [MBS.Agent.Plan.WeekNumber]
        $WeekNumber,
        ##
        [Parameter(Mandatory=$true, HelpMessage="Specify daily recurring from value", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$true, HelpMessage="Specify daily recurring from value", ParameterSetName='WeeklyEvery')]
        [ValidatePattern("^([01]?[0-9]|2[0-3]):[0-5][0-9]:[0][0]$")]
        [timespan]
        $OccursFrom,
        ##
        [Parameter(Mandatory=$true, HelpMessage="Specify daily recurring till value", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$true, HelpMessage="Specify daily recurring till value", ParameterSetName='WeeklyEvery')]
        [ValidatePattern("^([01]?[0-9]|2[0-3]):[0-5][0-9]:[0][0]$")]
        [timespan]
        $OccursTo,
        ##
        [Parameter(Mandatory=$true, HelpMessage="Specify recurring period value. Possible values: 1-59 min, or 1-180 hour", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$true, HelpMessage="Specify recurring period value. Possible values: 1-59 min, or 1-180 hour", ParameterSetName='WeeklyEvery')]
        [timespan]
        $OccursEvery,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (days). Possible values: 1..31", ParameterSetName='DailyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (days). Possible values: 1..31", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (days). Possible values: 1..31", ParameterSetName='DailyFull')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (weeks). Possible values: 1..31", ParameterSetName='WeeklyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (weeks). Possible values: 1..31", ParameterSetName='WeeklyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (weeks). Possible values: 1..31", ParameterSetName='WeeklyFull')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (months). Possible values: 1..31", ParameterSetName='MonthlyDayAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (months). Possible values: 1..31", ParameterSetName='MonthlyDayFull')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (months). Possible values: 1..31", ParameterSetName='MonthlyWeekAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value (months). Possible values: 1..31", ParameterSetName='MonthlyWeekFull')]
        [Int32][ValidateRange(1,31)]
        $RepeatInterval,
        ##
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='DailyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='DailyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='DailyFull')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='WeeklyAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='WeeklyEvery')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='WeeklyFull')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='MonthlyDayAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='MonthlyDayFull')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='MonthlyWeekAt')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='MonthlyWeekFull')]
        [DateTime]
        $RepeatStartDate
    )
    
    begin {
        
    }
    
    process {
        if ($Incremental) {
            $Schedule = New-Object -TypeName MBS.Agent.Plan.NBFIncrementalSchedule
        }else {
            $Schedule = New-Object -TypeName MBS.Agent.Plan.NBFFullSchedule
        }
        #if($Once){$Schedule.Frequency = 'Once'}
        if($Daily){$Schedule.Frequency = 'Daily'}
        if($Weekly){$Schedule.Frequency = 'Weekly'}
        if($Monthly -and -not $DayOfMonth){$Schedule.Frequency = 'Monthly'}
        if($Monthly -and $DayOfMonth){$Schedule.Frequency = 'DayOfMonth'}
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
