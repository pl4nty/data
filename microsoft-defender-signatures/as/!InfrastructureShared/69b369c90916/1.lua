-- Threat: !InfrastructureShared
-- Name: 69b369c90916
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = l_0_0:match("(%..?.?.?.?)%.lnk")
  local l_0_2 = ".docx|.docm|.xlsx|.xlsm|.csv|.pptx|.pps|.pptm|.db|.dat|.idx|.gif|.jpg"
  if l_0_1 ~= nil and l_0_2:find(l_0_1, 1, true) then
    return mp.CLEAN
  end
  if l_0_0:find("\\reci?ente?\\") then
    return mp.CLEAN
  end
  if l_0_0:find("\\microsoft outlook.lnk", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
