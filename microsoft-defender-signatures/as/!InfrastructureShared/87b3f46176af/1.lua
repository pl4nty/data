-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\87b3f46176af\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched then
  if (this_sigattrlog[1]).utf8p2 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC15: Overwrote pending register: R0 in 'AssignReg'

  local l_0_0, l_0_1 = nil
else
  do
    if (this_sigattrlog[2]).matched then
      if (this_sigattrlog[2]).utf8p2 == nil then
        return mp.CLEAN
      end
    else
      return mp.CLEAN
    end
    local l_0_2 = (string.lower)((this_sigattrlog[2]).utf8p2)
    if not (string.find)(l_0_2, "--remote-debugging-port=", 1, true) then
      return mp.CLEAN
    end
    add_parents()
    TrackPidAndTechniqueBM("BM", "T1102.002", "MsiHeadlessBrowserC2")
    return mp.INFECTED
  end
end

