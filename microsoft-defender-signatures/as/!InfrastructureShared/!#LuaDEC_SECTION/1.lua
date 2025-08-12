-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaDEC_SECTION\1.luac 

-- params : ...
-- function num : 0
for l_0_3 = 1, elfhdr.shnum do
  local l_0_4 = esec[l_0_3]
  local l_0_5 = (elf.GetSectionName)(l_0_4.name)
  if l_0_5 == "%.dec" or (string.match)(l_0_5, "%.dec\000") or l_0_5 == "%.decryption" or (string.match)(l_0_5, "%.decryption\000") then
    return mp.INFECTED
  end
end
return mp.CLEAN

