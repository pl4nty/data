-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanAIMCPPromptInjectionSA!Hook\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = 1536000
local l_0_1 = 32
local l_0_2 = 1024
local l_0_3 = 1200
local l_0_4 = 24
local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_5 == nil or l_0_5 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
local l_0_6 = {}
local l_0_7 = {}
l_0_7.id = "P0-1A"
l_0_7.rule = "CredExfilUpload"
l_0_7.class = "ExternalIp"
l_0_7.art = "SCPT:PromptInj:CredExfilUploadArt"
l_0_7.beh = "SCPT:PromptInj:CredExfilUploadBeh"
local l_0_8 = {}
-- DECOMPILER ERROR at PC28: No list found for R8 , SetList fails

local l_0_9 = {}
-- DECOMPILER ERROR at PC38: No list found for R9 , SetList fails

local l_0_10 = {}
-- DECOMPILER ERROR at PC48: No list found for R10 , SetList fails

local l_0_11 = {}
-- DECOMPILER ERROR at PC58: No list found for R11 , SetList fails

-- DECOMPILER ERROR at PC60: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC61: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC62: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC63: Overwrote pending register: R10 in 'AssignReg'

for i = l_0_9, l_0_10, l_0_11 do
  local l_0_13 = l_0_6[l_0_12]
  if (mp.get_mpattribute)(l_0_13.art) and (mp.get_mpattribute)(l_0_13.beh) then
    for l_0_17 = 1, #l_0_13.fences do
      -- DECOMPILER ERROR at PC93: Overwrote pending register: R8 in 'AssignReg'

      -- DECOMPILER ERROR at PC94: Overwrote pending register: R7 in 'AssignReg'

      if (mp.get_mpattribute)((l_0_13.fences)[l_0_17]) then
        break
      end
    end
  end
  do
    do
      if l_0_7 ~= nil then
        break
      end
      -- DECOMPILER ERROR at PC100: LeaveBlock: unexpected jumping out DO_STMT

    end
  end
end
-- DECOMPILER ERROR at PC103: Overwrote pending register: R9 in 'AssignReg'

if l_0_7 == nil then
  return l_0_9.CLEAN
end
local l_0_18 = nil
-- DECOMPILER ERROR at PC107: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC109: Overwrote pending register: R11 in 'AssignReg'

local l_0_19 = nil
do
  if (l_0_10.get_contextdata)(l_0_11.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE) ~= nil then
    local l_0_20 = nil
    -- DECOMPILER ERROR at PC117: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC120: Overwrote pending register: R9 in 'AssignReg'

  end
  do
    if (mp.getfilesize)() or l_0_0 < l_0_1 <= l_0_18 and nil ~= nil or 0 then
      local l_0_21, l_0_22, l_0_23 = nil
    end
    -- DECOMPILER ERROR at PC134: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC135: Overwrote pending register: R12 in 'AssignReg'

    if l_0_1 <= l_0_0 then
      l_0_18(l_0_19)
      -- DECOMPILER ERROR at PC138: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC139: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC140: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC141: Confused about usage of register: R11 in 'UnsetPending'

      local l_0_24 = nil
      -- DECOMPILER ERROR at PC143: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC144: Overwrote pending register: R13 in 'AssignReg'

      l_0_19(l_0_24)
      -- DECOMPILER ERROR at PC149: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC150: Overwrote pending register: R14 in 'AssignReg'

    end
    do
      -- DECOMPILER ERROR at PC155: Confused about usage of register: R9 in 'UnsetPending'

      if (l_0_18 ~= nil and l_0_19 == nil) or #l_0_19 < l_0_1 then
        return mp.CLEAN
      end
      -- DECOMPILER ERROR at PC161: Confused about usage of register: R9 in 'UnsetPending'

      -- DECOMPILER ERROR at PC166: Confused about usage of register: R9 in 'UnsetPending'

      -- DECOMPILER ERROR at PC166: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC167: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC168: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC173: Overwrote pending register: R12 in 'AssignReg'

      if l_0_0 < #l_0_19 then
        local l_0_25 = nil
        local l_0_26 = nil
        -- DECOMPILER ERROR at PC176: Overwrote pending register: R13 in 'AssignReg'

        local l_0_27 = nil
        -- DECOMPILER ERROR at PC185: Overwrote pending register: R14 in 'AssignReg'

        -- DECOMPILER ERROR at PC186: Overwrote pending register: R15 in 'AssignReg'

        local l_0_28 = nil
        -- DECOMPILER ERROR at PC194: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC195: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC206: Overwrote pending register: R15 in 'AssignReg'

        -- DECOMPILER ERROR at PC209: Overwrote pending register: R16 in 'AssignReg'

        -- DECOMPILER ERROR at PC211: Overwrote pending register: R17 in 'AssignReg'

        local l_0_31 = nil
        local l_0_32 = nil
        -- DECOMPILER ERROR at PC216: Overwrote pending register: R19 in 'AssignReg'

        if l_0_32 == "ExternalIp" then
          local l_0_33, l_0_34 = nil
          -- DECOMPILER ERROR at PC221: Overwrote pending register: R21 in 'AssignReg'

          if not l_0_32 then
            return l_0_34
          end
          -- DECOMPILER ERROR at PC223: Overwrote pending register: R21 in 'AssignReg'

          -- DECOMPILER ERROR at PC227: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC229: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC230: Overwrote pending register: R21 in 'AssignReg'

          local l_0_35 = nil
          local l_0_36 = nil
          while 1 do
            -- DECOMPILER ERROR at PC235: Overwrote pending register: R23 in 'AssignReg'

            if l_0_34 < l_0_4 then
              local l_0_37 = nil
            end
            if l_0_36 == nil then
              break
            end
            -- DECOMPILER ERROR at PC244: Overwrote pending register: R21 in 'AssignReg'

            -- DECOMPILER ERROR at PC246: Overwrote pending register: R22 in 'AssignReg'

          end
        else
          do
            -- DECOMPILER ERROR at PC249: Overwrote pending register: R19 in 'AssignReg'

            -- DECOMPILER ERROR at PC252: Overwrote pending register: R19 in 'AssignReg'

            -- DECOMPILER ERROR at PC255: Overwrote pending register: R17 in 'AssignReg'

            -- DECOMPILER ERROR at PC257: Overwrote pending register: R19 in 'AssignReg'

            -- DECOMPILER ERROR at PC260: Overwrote pending register: R17 in 'AssignReg'

            -- DECOMPILER ERROR at PC261: Overwrote pending register: R19 in 'AssignReg'

            -- DECOMPILER ERROR at PC264: Overwrote pending register: R19 in 'AssignReg'

            -- DECOMPILER ERROR at PC265: Overwrote pending register: R19 in 'AssignReg'

            if l_0_32 ~= "ProtectedPath" or l_0_32 == 0 then
              return l_0_32
            end
            -- DECOMPILER ERROR at PC267: Overwrote pending register: R19 in 'AssignReg'

            local l_0_38 = nil
            -- DECOMPILER ERROR at PC273: Overwrote pending register: R20 in 'AssignReg'

            -- DECOMPILER ERROR at PC274: Overwrote pending register: R20 in 'AssignReg'

            if l_0_38 == 0 then
              return l_0_38
            end
            -- DECOMPILER ERROR at PC276: Overwrote pending register: R20 in 'AssignReg'

            local l_0_39 = l_0_34
            -- DECOMPILER ERROR at PC278: Overwrote pending register: R22 in 'AssignReg'

            -- DECOMPILER ERROR at PC279: Overwrote pending register: R23 in 'AssignReg'

            for l_0_43 = l_0_39, l_0_35, l_0_36 do
              local l_0_43 = nil
              for l_0_47 = l_0_43, #l_0_32 do
                local l_0_47 = nil
                local l_0_48 = nil
                do
                  do
                    local l_0_49 = nil
                    -- DECOMPILER ERROR at PC290: Overwrote pending register: R30 in 'AssignReg'

                    -- DECOMPILER ERROR at PC291: Overwrote pending register: R29 in 'AssignReg'

                    -- DECOMPILER ERROR at PC292: Overwrote pending register: R31 in 'AssignReg'

                    -- DECOMPILER ERROR at PC295: Overwrote pending register: R20 in 'AssignReg'

                    if l_0_48 >= l_0_47 or l_0_49 <= l_0_3 then
                      break
                    end
                    -- DECOMPILER ERROR at PC297: LeaveBlock: unexpected jumping out DO_STMT

                  end
                end
              end
              if l_0_38 then
                do break end
                -- DECOMPILER ERROR at PC301: Confused about usage of register R25 for local variables in 'ReleaseLocals'

              end
            end
            -- DECOMPILER ERROR at PC304: Overwrote pending register: R21 in 'AssignReg'

            if not l_0_38 then
              return l_0_39.CLEAN
            end
            local l_0_50 = l_0_43
            local l_0_51 = nil
            local l_0_52 = nil
            local l_0_53 = nil
            do
              -- DECOMPILER ERROR at PC329: Overwrote pending register: R25 in 'AssignReg'

              -- DECOMPILER ERROR at PC330: Overwrote pending register: R25 in 'AssignReg'

              -- DECOMPILER ERROR at PC332: Overwrote pending register: R26 in 'AssignReg'

              -- DECOMPILER ERROR at PC333: Confused about usage of register: R9 in 'UnsetPending'

              -- DECOMPILER ERROR at PC335: Overwrote pending register: R29 in 'AssignReg'

              -- DECOMPILER ERROR at PC340: Overwrote pending register: R25 in 'AssignReg'

              -- DECOMPILER ERROR at PC346: Overwrote pending register: R25 in 'AssignReg'

              -- DECOMPILER ERROR at PC350: Confused about usage of register: R9 in 'UnsetPending'

              -- DECOMPILER ERROR at PC350: Overwrote pending register: R25 in 'AssignReg'

              -- DECOMPILER ERROR at PC354: Overwrote pending register: R25 in 'AssignReg'

              -- DECOMPILER ERROR at PC358: Overwrote pending register: R25 in 'AssignReg'

              -- DECOMPILER ERROR at PC363: Overwrote pending register: R25 in 'AssignReg'

              -- DECOMPILER ERROR at PC367: Overwrote pending register: R25 in 'AssignReg'

              -- DECOMPILER ERROR at PC370: Overwrote pending register: R25 in 'AssignReg'

              -- DECOMPILER ERROR at PC371: Overwrote pending register: R25 in 'AssignReg'

              if ((not l_0_50 and (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)) or safeJsonSerialize(l_0_50) ~= nil) and l_0_50 > 0 then
                l_0_50(safeJsonSerialize(l_0_50))
              end
              -- DECOMPILER ERROR at PC374: Overwrote pending register: R25 in 'AssignReg'

              -- DECOMPILER ERROR at PC375: Overwrote pending register: R25 in 'AssignReg'

              do return l_0_50 end
              -- DECOMPILER ERROR at PC377: Confused about usage of register R27 for local variables in 'ReleaseLocals'

              -- WARNING: undefined locals caused missing assignments!
            end
          end
        end
      end
    end
  end
end

