$module = $MyInvocation.MyCommand.ScriptBlock.Module
$module.OnRemove = {Reset-IISServerManager -Confirm:$false}

# SIG # Begin signature block
