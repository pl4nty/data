-- Threat: !InfrastructureShared
-- Name: !#TEL:LUA:Office:Macro:ModWrite
-- Type: 13
-- MpAttributes: MHSTR:MacroInside

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = {
    [".doc"] = "",
    [".docm"] = "",
    [".dotm"] = "",
    [".dot"] = "",
    [".xls"] = "",
    [".xlsm"] = "",
    [".ppt"] = "",
    [".pptm"] = ""
  }
  local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_CNAME, mp.FILEPATH_QUERY_LOWERCASE)):sub(-5)
  local l_0_3 = l_0_2:sub(-4)
  if l_0_1[l_0_3] ~= nil or l_0_1[l_0_2] ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
