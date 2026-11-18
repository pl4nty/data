-- Threat: !InfrastructureShared
-- Name: !#Lua:ZeroPlusAmsiTrigger.B
-- Type: 24
-- MpAttributes: MpIsPowerShellAMSIScan

if mp.get_mpattributesubstring("SLF:") then
  if mp.get_mpattributesubstring("!ams") and mp.get_mpattributesubstring("SLF:TTCTX:") then
    return mp.INFECTED
  end
  if mp.get_mpattributesubstring(":PS/") or mp.get_mpattributesubstring(":PowerShell/") then
    return mp.INFECTED
  end
end
return mp.CLEAN
