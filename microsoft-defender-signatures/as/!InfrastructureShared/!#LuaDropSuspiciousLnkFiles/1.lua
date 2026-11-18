-- Threat: !InfrastructureShared
-- Name: !#Lua:DropSuspiciousLnkFiles
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == "passwords.lnk" or l_0_1 == "..lnk" then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if string.len(l_0_2) < 4 or string.len(l_0_2) > 11 then
      return mp.CLEAN
    end
    local l_0_3 = string.sub(l_0_2, -4)
    if l_0_3 == ".exe" and mp.getfilesize() < 512 then
      mp.set_mpattribute("Lua:DropSuspiciousLnkFiles")
    end
  end
end
return mp.CLEAN
