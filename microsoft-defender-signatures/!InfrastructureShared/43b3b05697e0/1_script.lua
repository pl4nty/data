-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43b3b05697e0\1_luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  do
    if l_0_0 then
      local l_0_2 = nil
      if (string.match)(l_0_0, "imagepath:([^;]+)") then
        if isTainted((string.match)(l_0_0, "imagepath:([^;]+)"), "upx_file_created_taint") then
          (bm.add_related_file)((string.match)(l_0_0, "imagepath:([^;]+)"))
          return mp.INFECTED
        end
        if isTainted((string.match)(l_0_0, "imagepath:([^;]+)"), "remote_file_created_taint") then
          (bm.add_related_file)((string.match)(l_0_0, "imagepath:([^;]+)"))
          return mp.INFECTED
        end
      end
    end
    return mp.CLEAN
  end
end

