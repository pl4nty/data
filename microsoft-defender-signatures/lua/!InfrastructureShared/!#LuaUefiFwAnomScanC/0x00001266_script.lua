-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaUefiFwAnomScanC\0x00001266_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 5242880 or l_0_0 < 3072 then
  return mp.CLEAN
end
local l_0_1 = (mp.enum_mpattributesubstring)("CMN:HSTR:UefiUtils")
if #l_0_1 > 0 then
  return mp.CLEAN
end
local l_0_2 = 0
local l_0_3 = false
local l_0_4 = false
local l_0_5 = pehdr.NumberOfSections
if l_0_5 <= 0 or l_0_5 >= 10 then
  return mp.CLEAN
end
for l_0_9 = 1, l_0_5 do
  local l_0_10 = tostring((pesecs[l_0_9]).Name)
  if l_0_10 == nil then
    return mp.CLEAN
  end
  local l_0_11 = (pesecs[l_0_9]).Characteristics
  if l_0_11 == nil then
    return mp.CLEAN
  end
  if l_0_10 == "" and (mp.bitand)(l_0_11, 1610612768) == 1610612768 then
    l_0_2 = l_0_2 + 1
    l_0_3 = true
  else
    if l_0_10 == ".text" or l_0_10 == ".data" or l_0_10 == ".edata" or l_0_10 == ".rdata" or l_0_10 == ".idata" or l_0_10 == ".reloc" or l_0_10 == ".xdata" or l_0_10 == ".pdata" or l_0_10 == ".bss" or l_0_10 == ".rsrc" then
      l_0_4 = true
    end
  end
end
if l_0_3 == true then
  if l_0_2 == 1 and l_0_4 then
    (mp.set_mpattribute)("Lua:UefiFwBlankSection")
  else
    if l_0_2 < pehdr.NumberOfSections and l_0_4 then
      (mp.set_mpattribute)("Lua:UefiFwMultiBlankSection")
    else
      ;
      (mp.set_mpattribute)("Lua:UefiFwAnomSectionNames")
    end
  end
  return mp.INFECTED
end
return mp.CLEAN

