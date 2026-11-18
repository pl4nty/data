-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextScriptTemp
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  local l_0_2
  if l_0_1:find("^rad.....%.tmp%.exe") == 1 then
    l_0_2 = "exe"
  elseif l_0_1:find("^rad.....%.tmp%.dll") == 1 then
    l_0_2 = "dll"
  end
  if l_0_2 ~= nil then
    local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_3 == "wscript.exe" or l_0_3 == "cscript.exe" then
      if l_0_2 == "exe" then
        mp.set_mpattribute("Lua:ContextScriptTempExe.A")
      elseif l_0_2 == "dll" then
        mp.set_mpattribute("Lua:ContextScriptTempDll.A")
      end
    end
  end
end
return mp.CLEAN
