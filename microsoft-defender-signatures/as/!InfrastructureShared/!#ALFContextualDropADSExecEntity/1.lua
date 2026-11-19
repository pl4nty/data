-- Threat: !InfrastructureShared
-- Name: !#ALF:ContextualDropADSExecEntity
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if string.find(l_0_1, "%w+[:]%w+%.%w+$") ~= nil then
    local l_0_2 = {
      [".cpl"] = "",
      [".exe"] = "",
      [".dll"] = "",
      [".scr"] = "",
      [".pif"] = "",
      [".jse"] = "",
      [".vbs"] = "",
      [".vbe"] = "",
      [".ps1"] = ""
    }
    if l_0_2[string.lower(string.sub(l_0_1, -4))] then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
