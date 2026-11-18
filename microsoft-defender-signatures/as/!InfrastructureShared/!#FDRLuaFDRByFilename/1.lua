-- Threat: !InfrastructureShared
-- Name: !#FDR:Lua:FDRByFilename
-- Type: 8

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or l_0_0:len() < 5 then
  return mp.CLEAN
end
local l_0_1 = {
  "^deedee%.exe$",
  "^tm%(.+%)11%d%d%.exe$"
}
for l_0_2 = 1, #l_0_1 do
  if l_0_0:find(l_0_1[l_0_2]) then
    return mp.INFECTED
  end
end
return mp.CLEAN
