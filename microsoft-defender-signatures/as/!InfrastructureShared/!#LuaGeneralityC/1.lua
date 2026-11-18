-- Threat: !InfrastructureShared
-- Name: !#Lua:GeneralityC
-- Type: 24

if not mp.get_mpattribute("AndroidOS:HSTR:Generality.C") then
  return mp.CLEAN
end
if not mp.get_mpattribute("AndroidOS:HSTR:AndroidElf") then
  local l_0_0 = string.sub(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE)), -5):match("(%.%w+)$")
  local l_0_1 = {
    [".ko"] = "",
    [".o"] = ""
  }
  if l_0_1[l_0_0] then
    return mp.CLEAN
  end
  local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_2:find("snort", 1, true) then
    return mp.CLEAN
  end
end
local l_0_3 = mp.enum_mpattributesubstring("TEL:Exploit:Android/CVE")
if #l_0_3 == 0 then
  return mp.INFECTED
end
return mp.CLEAN
