-- Threat: !InfrastructureShared
-- Name: !#Lua:CrossriderInstallerFilenames
-- Type: 10

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = {
    ["sys.exe"] = true,
    ["slups.exe"] = true
  }
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1[l_0_2] then
    local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if string.match(l_0_3, "\\appdata\\local") then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
