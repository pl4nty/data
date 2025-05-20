-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a699_869.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = tonumber
  local l_1_4 = (l_1_0:reverse()):gsub
  do
    local l_1_5 = l_1_0:reverse()
    l_1_4 = l_1_4(l_1_5, ".", function(l_2_0)
    -- function num : 0_0_0
    local l_2_1 = string.format
    local l_2_2 = "%02x"
    do
      local l_2_3, l_2_4 = (string.byte)(l_2_0), .end
      do return l_2_1(l_2_2, l_2_3, l_2_4) end
      -- DECOMPILER ERROR at PC9: Confused about usage of register R2 for local variables in 'ReleaseLocals'

    end
  end
)
    local l_1_2 = nil
    l_1_5 = 16
    local l_1_3 = nil
    do return l_1_1(l_1_4, l_1_5) end
    -- DECOMPILER ERROR at PC10: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

if not peattributes.hasappendeddata then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
local l_0_2 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_SECURITY]).RVA
if l_0_2 == 0 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_3 = l_0_0((mp.readfile)(l_0_2, 4))
;
(mp.readprotection)(true)
local l_0_4 = (pesecs[pehdr.NumberOfSections]).PointerToRawData + (pesecs[pehdr.NumberOfSections]).SizeOfRawData
local l_0_5 = l_0_1 - l_0_4
if l_0_1 < l_0_3 and l_0_5 > 0 and l_0_5 < 20480 then
  return mp.INFECTED
end
return mp.CLEAN

