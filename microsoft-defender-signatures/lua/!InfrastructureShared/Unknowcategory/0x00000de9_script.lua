-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000de9_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
for l_0_5,l_0_6 in ipairs(l_0_0) do
  if l_0_6.image_path ~= nil and (mp.bitand)(l_0_6.reason_ex, 1) == 1 and l_0_6.ppid ~= nil then
    local l_0_7, l_0_8 = (bm.get_process_relationships)(l_0_6.ppid)
    for l_0_12,l_0_13 in ipairs(l_0_7) do
      if l_0_13.image_path ~= nil then
        local l_0_14 = (string.lower)(l_0_13.image_path)
        if (string.find)(l_0_14, "runcommandextension.exe", 1, true) then
          return mp.INFECTED
        end
      end
    end
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC54: Confused about usage of register R3 for local variables in 'ReleaseLocals'


