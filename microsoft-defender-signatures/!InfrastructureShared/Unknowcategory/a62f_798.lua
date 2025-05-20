-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a62f_798.luac 

-- params : ...
-- function num : 0
Version_to_str = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = (crypto.shr64)(l_1_0, 48)
  local l_1_2 = (crypto.bitand)((crypto.shr64)(l_1_0, 32), 65535)
  local l_1_3 = (crypto.bitand)((crypto.shr64)(l_1_0, 16), 65535)
  local l_1_4 = (crypto.bitand)(l_1_0, 65535)
  return tostring(l_1_1) .. "." .. tostring(l_1_2) .. "." .. tostring(l_1_3) .. "." .. tostring(l_1_4)
end

GetSectionInfoOfVirtualAddress = function(l_2_0)
  -- function num : 0_1
  if l_2_0 == nil or pehdr == nil or pehdr.NumberOfSections == nil or pehdr.NumberOfSections == 0 or pesecs == nil then
    return nil
  end
  local l_2_1 = pehdr.ImageBase
  for l_2_5 = 1, pehdr.NumberOfSections do
    local l_2_6 = (pesecs[l_2_5]).VirtualAddress
    local l_2_7 = (pesecs[l_2_5]).VirtualSize
    local l_2_8 = l_2_1 + l_2_6
    local l_2_9 = l_2_8 + l_2_7
    if l_2_8 <= l_2_0 and l_2_0 <= l_2_9 then
      local l_2_10 = (pesecs[l_2_5]).Name
      return l_2_5, l_2_10, l_2_6, l_2_7
    end
  end
end


