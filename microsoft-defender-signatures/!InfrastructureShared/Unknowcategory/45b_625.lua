-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\45b_625.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 == nil then
    return 
  end
  for l_1_4 = 1, pehdr.NumberOfSections do
    if tostring((pesecs[l_1_4]).Name) == l_1_0 then
      return (pesecs[l_1_4]).VirtualAddress, (pesecs[l_1_4]).VirtualSize
    end
  end
end

local l_0_1, l_0_2 = l_0_0(".rsrc")
local l_0_3 = pehdr.ImageBase
local l_0_4 = (hstrlog[1]).VA
if l_0_1 ~= nil and l_0_2 ~= nil and l_0_3 ~= nil and l_0_4 ~= nil then
  local l_0_5 = l_0_3 + l_0_1
  local l_0_6 = l_0_5 + l_0_2
  if l_0_5 <= l_0_4 and l_0_4 <= l_0_6 then
    (mp.set_mpattribute)("HSTR:EmbeddedXorPeFileInResource.A")
  end
end
do
  ;
  (mp.set_mpattribute)("HSTR:EmbeddedXorPeFile.A")
  return mp.INFECTED
end

