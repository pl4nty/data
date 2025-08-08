-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!TerraLoaderC\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (pe.get_exports)()
if l_0_0 == 0 or l_0_1 == nil or l_0_0 > 32 then
  return mp.CLEAN
end
local l_0_2 = ""
local l_0_3 = {}
local l_0_4 = 0
local l_0_5 = 0
local l_0_6 = function(l_1_0)
  -- function num : 0_0
  if #l_1_0 < 2 then
    return false
  end
  do
    local l_1_1 = {}
    -- DECOMPILER ERROR at PC12: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC13: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC14: Overwrote pending register: R3 in 'AssignReg'

    for l_1_5,l_1_6 in ("8")("16") do
      -- DECOMPILER ERROR at PC17: Overwrote pending register: R7 in 'AssignReg'

      local l_1_7 = "256" .. l_1_6 .. "$"
      if (string.match)(l_1_0, l_1_7) then
        return true
      end
    end
    do return false end
    -- WARNING: undefined locals caused missing assignments!
  end
end

;
(mp.readprotection)(false)
for l_0_10 = 1, l_0_0 do
  l_0_2 = (pe.mmap_string_rva)((l_0_1[l_0_10]).namerva, 64)
  if l_0_2 ~= nil then
    l_0_3 = (pe.mmap_rva_nofastfail)((l_0_1[l_0_10]).rva, 3)
    if #l_0_3 ~= 3 then
      return mp.CLEAN
    end
    if (string.byte)(l_0_3, 1) == 49 and (string.byte)(l_0_3, 2) == 192 and (string.byte)(l_0_3, 3) == 195 then
      l_0_4 = l_0_4 + 1
      if l_0_6(l_0_2) then
        l_0_5 = l_0_5 + 1
      end
    end
  end
end
;
(mp.readprotection)(true)
if l_0_4 < 9 or l_0_5 < (l_0_4) / 2 then
  return mp.CLEAN
end
return mp.INFECTED

