-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\17fb31b3d7efc\0x0000c2d7_luac 

-- params : ...
-- function num : 0
local l_0_4 = nil
if not (MpCommon.GetPersistContextNoPath)("lnkarg_sb") then
  return mp.CLEAN
end
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  l_0_4 = (string.lower)((this_sigattrlog[1]).utf8p2)
  local l_0_0 = nil
else
  do
    if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
      l_0_4 = (string.lower)((this_sigattrlog[2]).utf8p2)
    else
      if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 then
        l_0_4 = (string.lower)((this_sigattrlog[3]).utf8p2)
        local l_0_1 = nil
      else
        do
          if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 then
            l_0_4 = (string.lower)((this_sigattrlog[4]).utf8p2)
          else
            if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 then
              l_0_4 = (string.lower)((this_sigattrlog[5]).utf8p2)
              local l_0_2 = nil
            else
              do
                if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 then
                  l_0_4 = (string.lower)((this_sigattrlog[6]).utf8p2)
                else
                  if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p2 then
                    l_0_4 = (string.lower)((this_sigattrlog[7]).utf8p2)
                    local l_0_3 = nil
                  else
                    do
                      do return mp.CLEAN end
                      -- DECOMPILER ERROR at PC139: Confused about usage of register: R1 in 'UnsetPending'

                      for l_0_8,l_0_9 in ipairs(l_0_3) do
                        local l_0_5 = nil
                        -- DECOMPILER ERROR at PC144: Confused about usage of register: R6 in 'UnsetPending'

                        if contains(l_0_4, R6_PC144) then
                          return mp.INFECTED
                        end
                      end
                      return mp.CLEAN
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

