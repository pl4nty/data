-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\177b3fdb445b1\1.luac 

-- params : ...
-- function num : 0
local l_0_3 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0 = ""
else
  do
    -- DECOMPILER ERROR at PC35: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC53: Overwrote pending register: R0 in 'AssignReg'

    if (not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[3]).matched) and (this_sigattrlog[3]).utf8p1 ~= nil and (this_sigattrlog[3]).utf8p2 ~= nil then
      local l_0_1 = nil
    else
      do
        -- DECOMPILER ERROR at PC71: Overwrote pending register: R0 in 'AssignReg'

        -- DECOMPILER ERROR at PC89: Overwrote pending register: R0 in 'AssignReg'

        do
          if (not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p1 == nil or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[5]).matched) and (this_sigattrlog[5]).utf8p1 ~= nil and (this_sigattrlog[5]).utf8p2 ~= nil then
            local l_0_2 = nil
          end
          if not l_0_3 then
            return mp.CLEAN
          end
          local l_0_4 = nil
          for l_0_8 = 1, mp.SIGATTR_LOG_SZ do
            local l_0_5 = "DataExfilCreatedFile"
            -- DECOMPILER ERROR at PC102: Confused about usage of register: R6 in 'UnsetPending'

            if (sigattr_head[R6_PC102]).matched and (sigattr_head[R6_PC102]).attribute == 16384 and (sigattr_head[R6_PC102]).utf8p1 then
              l_0_4 = (string.lower)((sigattr_head[R6_PC102]).utf8p1)
              local l_0_10 = (string.match)(l_0_4, "(%.[^%.]+)$")
              local l_0_11 = contains
              local l_0_12 = l_0_10
              l_0_11 = l_0_11(l_0_12, {".zip", ".7z", ".rar", ".z", ".arj", ".tar", ".gz", ".tar.gz", ".s7z", ".ace", ".rk", ".gz", ".lz", ".zipx", ".bz2"})
              if l_0_11 then
                l_0_11 = AppendToRollingQueue
                l_0_12 = "DataComTrack"
                l_0_11(l_0_12, l_0_5, l_0_4)
                l_0_11 = mp
                l_0_11 = l_0_11.INFECTED
                return l_0_11
              end
            end
          end
          return mp.CLEAN
        end
      end
    end
  end
end

