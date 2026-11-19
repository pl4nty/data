-- Threat: !InfrastructureShared
-- Name: 7678475c977f
-- Type: 21
-- Flags: 1

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FNAME):lower()
if l_0_0:find("urefs.dll", 1, true) then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 ~= nil and l_0_1.OriginalFilename:lower() == "urefs.dll" then
  return mp.CLEAN
end
local l_0_2 = 0
if hstrlog[2].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[3].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[4].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[5].matched then
  l_0_2 = l_0_2 + 1
end
if hstrlog[6].matched then
  l_0_2 = l_0_2 + 1
end
local l_0_3 = 0
if hstrlog[7].matched then
  l_0_3 = l_0_3 + 1
end
if hstrlog[8].matched then
  l_0_3 = l_0_3 + 1
end
if hstrlog[9].matched then
  l_0_3 = l_0_3 + 1
end
if hstrlog[10].matched then
  l_0_3 = l_0_3 + 1
end
if hstrlog[11].matched then
  l_0_3 = l_0_3 + 1
end
if hstrlog[1].matched and l_0_2 == 5 or l_0_3 == 5 then
  return mp.INFECTED
end
return mp.CLEAN
