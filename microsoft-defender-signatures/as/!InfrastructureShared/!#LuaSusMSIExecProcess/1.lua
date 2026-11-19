-- Threat: !InfrastructureShared
-- Name: !#Lua:SusMSIExecProcess
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (BM_OLE_FILE | Lua:MSIExt)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME) or ""
  local l_0_1 = "Lua:MSIParent_"
  if l_0_0 == "" then
    l_0_1 = l_0_1 .. "Unknown"
  else
    local l_0_2 = {
      ["nxtsvc.exe"] = true,
      ["receiver.exe"] = true,
      ["ndtrack.exe"] = true,
      ["adobearm.exe"] = true,
      ["applicationcollection.exe"] = true,
      ["dellsupportassistremedationservice.exe"] = true,
      ["monitoringhost.exe"] = true
    }
    local l_0_3 = l_0_2[l_0_0:lower()]
    if l_0_3 ~= true then
      l_0_1 = l_0_1 .. "NonMonitored"
    end
  end
  mp.set_mpattribute(l_0_1)
end
return mp.CLEAN
