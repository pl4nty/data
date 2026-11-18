-- Threat: !InfrastructureShared
-- Name: 5d291caee868
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if l_0_2 == nil then
  l_0_0 = mp.getfilename()
  if l_0_0 == nil then
    return mp.CLEAN
  end
  l_0_1 = l_0_0:sub(-5)
else
  l_0_1 = l_0_2:sub(-5)
end
if string.find(l_0_1:lower(), ".asp") then
  return mp.INFECTED
end
return mp.LOWFI
