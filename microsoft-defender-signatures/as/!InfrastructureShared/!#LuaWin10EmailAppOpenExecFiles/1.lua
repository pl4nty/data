-- Threat: !InfrastructureShared
-- Name: !#Lua:Win10EmailAppOpenExecFiles
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if string.find(l_0_2, "appdata\\local\\packages\\microsoft.windowscommunicationsapps_8wekyb3d8bbwe\\localstate\\files\\s0\\", 1, true) ~= nil then
    local l_0_3 = {
      ["runtimebroker.exe"] = true,
      ["hxtsr.exe"] = true
    }
    if l_0_3[l_0_1] == true and string.len(mp.getfilename()) > 4 then
      local l_0_4 = string.lower(string.sub(mp.getfilename(), -4))
      if l_0_4 == ".exe" or l_0_4 == ".jar" or l_0_4 == ".zip" then
        mp.set_mpattribute("Lua:Win10MailAppOpenExecFiles")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
