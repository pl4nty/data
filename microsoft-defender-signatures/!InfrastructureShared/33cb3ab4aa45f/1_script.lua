-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\33cb3ab4aa45f\1_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1, l_0_2, l_0_3 = nil, nil, nil, nil
local l_0_4 = nil
local l_0_5 = nil
if (bm.GetProcedureMatchDuration)(1) < (bm.GetProcedureMatchDuration)(0) then
  l_0_5 = (bm.GetProcedureMatchDuration)(0) - (bm.GetProcedureMatchDuration)(1)
else
  l_0_5 = (bm.GetProcedureMatchDuration)(1) - (bm.GetProcedureMatchDuration)(0)
end
if l_0_5 > 20000000 then
  return mp.CLEAN
end
if (this_sigattrlog[13]).matched then
  l_0_4 = (this_sigattrlog[13]).utf8p1
else
  if (this_sigattrlog[14]).matched then
    l_0_4 = (this_sigattrlog[14]).utf8p1
  else
    if (this_sigattrlog[15]).matched then
      l_0_4 = (this_sigattrlog[15]).utf8p1
    else
      if (this_sigattrlog[16]).matched then
        l_0_4 = (this_sigattrlog[16]).utf8p1
      else
        if (this_sigattrlog[18]).matched then
          l_0_4 = (this_sigattrlog[18]).utf8p1
        else
          if (this_sigattrlog[17]).matched then
            l_0_4 = (this_sigattrlog[17]).utf8p1
          else
            if (this_sigattrlog[19]).matched then
              l_0_4 = (this_sigattrlog[19]).utf8p1
            end
          end
        end
      end
    end
  end
end
-- DECOMPILER ERROR at PC145: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC154: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC163: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC171: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC180: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC189: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC198: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC207: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC216: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC225: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC234: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC239: Confused about usage of register: R2 in 'UnsetPending'

-- DECOMPILER ERROR at PC242: Confused about usage of register: R2 in 'UnsetPending'

if (string.match)(l_0_4, "^/home/") or (string.match)(l_0_4, "^/root/") or (string.match)(l_0_4, "^/tmp/") or (string.match)(l_0_4, "^/var/") or (string.match)(l_0_4, "^/dev/shm/") or (string.match)(l_0_4, "^/srv/ftp/") or (string.match)(l_0_4, "^/mnt/") then
  if (((((((((((((this_sigattrlog[1]).matched and not (this_sigattrlog[2]).matched) or (this_sigattrlog[3]).matched) and not (this_sigattrlog[4]).matched) or (this_sigattrlog[5]).matched) and not (this_sigattrlog[6]).matched) or (this_sigattrlog[7]).matched) and not (this_sigattrlog[8]).matched) or (this_sigattrlog[9]).matched) and not (this_sigattrlog[10]).matched) or (this_sigattrlog[11]).matched) and not (this_sigattrlog[12]).matched) or (this_sigattrlog[1]).utf8p2 ~= nil) and (this_sigattrlog[1]).utf8p2 ~= "" then
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC253: Confused about usage of register: R3 in 'UnsetPending'

    -- DECOMPILER ERROR at PC259: Confused about usage of register: R3 in 'UnsetPending'

    -- DECOMPILER ERROR at PC265: Unhandled construct in 'MakeBoolean' P1

    if extract_script_file((this_sigattrlog[1]).utf8p2) ~= nil and extract_script_file((this_sigattrlog[1]).utf8p2) ~= "" and get_basename(l_0_4) ~= get_basename(extract_script_file((this_sigattrlog[1]).utf8p2)) then
      return mp.CLEAN
    end
    do return mp.CLEAN end
    ;
    (bm.trigger_sig)("TestExecutionFromScriptInSuspLocation", l_0_4)
    do return mp.INFECTED end
    return mp.CLEAN
  end
end

