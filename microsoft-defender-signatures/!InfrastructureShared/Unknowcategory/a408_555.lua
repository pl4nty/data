-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a408_555.luac 

-- params : ...
-- function num : 0
for l_0_3 = 1, pehdr.NumberOfSections do
  if (pesecs[l_0_3]).Name == "snapshot" then
    local l_0_4 = (pesecs[l_0_3]).PointerToRawData
    local l_0_5 = (pesecs[l_0_3]).SizeOfRawData
    if l_0_4 ~= 0 and l_0_5 ~= 0 and l_0_4 + l_0_5 <= (mp.getfilesize)() then
      (mp.readprotection)(false)
      local l_0_6 = (mp.readfile)(l_0_4, l_0_5)
      ;
      (mp.readprotection)(true)
      ;
      (mp.vfo_add_buffer)(l_0_6, "[DartAotSnapshot]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

