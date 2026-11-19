-- Threat: !InfrastructureShared
-- Name: aa8c3016ad16
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if #l_0_0 == 64 then
  return mp.CLEAN
end
local l_0_1 = "qnetd"
local l_0_2 = "agtty(.-)%.bat"
if l_0_0 == l_0_1 then
  return mp.INFECTED
elseif string.match(l_0_0, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
