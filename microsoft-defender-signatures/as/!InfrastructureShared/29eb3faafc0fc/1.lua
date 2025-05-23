-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\29eb3faafc0fc\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 ~= nil then
    local l_0_0 = nil
  else
  end
  -- DECOMPILER ERROR at PC40: Overwrote pending register: R0 in 'AssignReg'

  do
    if (not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[4]).matched) and (this_sigattrlog[4]).utf8p1 ~= nil then
      local l_0_1 = (this_sigattrlog[3]).utf8p1
    else
    end
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    do
      if (not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil or (this_sigattrlog[6]).matched) and (this_sigattrlog[6]).utf8p1 ~= nil then
        local l_0_2 = (this_sigattrlog[5]).utf8p1
      else
      end
      -- DECOMPILER ERROR at PC96: Overwrote pending register: R0 in 'AssignReg'

      do
        if (not (this_sigattrlog[7]).matched or (this_sigattrlog[7]).utf8p1 == nil or (this_sigattrlog[8]).matched) and (this_sigattrlog[8]).utf8p1 ~= nil then
          local l_0_3 = (this_sigattrlog[7]).utf8p1
        else
        end
        -- DECOMPILER ERROR at PC124: Overwrote pending register: R0 in 'AssignReg'

        do
          if (not (this_sigattrlog[9]).matched or (this_sigattrlog[9]).utf8p1 == nil or (this_sigattrlog[10]).matched) and (this_sigattrlog[10]).utf8p1 ~= nil then
            local l_0_4, l_0_5, l_0_6 = (this_sigattrlog[9]).utf8p1
          else
          end
          if not (this_sigattrlog[11]).matched or (this_sigattrlog[11]).utf8p1 == nil or (this_sigattrlog[11]).utf8p1 then
            local l_0_7 = nil
            local l_0_8 = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  local l_1_2 = {}
  local l_1_3 = false
  l_1_0 = l_1_0:gsub("<!%-%-(.-)%-%->", "")
  l_1_0 = l_1_0:gsub("<%?(.-)%?>", "")
  l_1_0:gsub("<([/!]?)([%a_][%w-:_]*)%s*(/?>?)([^<]*)", function(l_2_0, l_2_1, l_2_2, l_2_3)
    -- function num : 0_0_0 , upvalues : l_1_1, l_1_3, l_1_2
    if #l_2_0 == 0 then
      local l_2_4 = {}
      if #l_2_2 == 0 then
        local l_2_5 = 0
        for l_2_9,l_2_10,l_2_11,l_2_12,l_2_13 in (string.gmatch)(l_2_3, "(([%a_][%w-:_]*)%s*=%s*([\'\"])(.-)%3%s*(/?>?))") do
          l_2_5 = l_2_5 + #l_2_9
          l_2_4[l_2_10] = l_2_12
          if #l_2_13 ~= 0 then
            if l_2_13 == "/>" then
              l_2_3 = ""
            else
              if l_2_13 == ">" then
                l_2_3 = l_2_3:sub(l_2_5 + 1)
              else
                error("invalid tag")
              end
            end
            l_2_2 = l_2_13
          end
        end
      end
      do
        do
          l_2_5 = table
          l_2_5 = l_2_5.insert
          l_2_5(l_1_1, l_2_1)
          l_2_5 = l_1_3
          if not l_2_5 and l_2_1 == "Command" then
            l_2_5 = true
            l_1_3 = l_2_5
          end
          l_2_5 = l_1_3
          if l_2_5 and l_2_3 ~= "" then
            l_2_5 = table
            l_2_5 = l_2_5.insert
            l_2_5(l_1_2, l_2_3)
          end
          l_2_5 = next
          l_2_5 = l_2_5(l_2_4)
          if not l_2_5 then
            l_2_4 = nil
          end
          l_2_5 = l_2_5(l_2_2, 1)
          if l_2_5 == (string.byte)("/") then
            l_2_5 = table
            l_2_5 = l_2_5.remove
            l_2_5(l_1_1)
          end
          if l_2_0 == "/" then
            l_2_4 = l_1_1
            l_2_4 = l_2_4[#l_1_1]
            if l_2_4 == l_2_1 then
              l_2_4 = table
              l_2_4 = l_2_4.remove
              l_2_4(l_1_1)
            else
              l_2_4 = error
              l_2_4("invalid XML: mismatch closing tag")
            end
            l_2_4 = l_1_3
            if l_2_4 and l_2_1 == "Command" then
              l_2_4 = false
              l_1_3 = l_2_4
            end
          else
            if l_2_0 == "!" then
              l_2_4 = error
              l_2_4("unsupported tag type")
            else
              l_2_4 = error
              l_2_4("parsing error")
            end
          end
        end
      end
    end
  end
)
  return l_1_2
end

            local l_0_9 = function(l_2_0)
  -- function num : 0_1
  local l_2_1 = {}
  for l_2_5 in (string.gmatch)(l_2_0, "http[s]?://[^\"%s]+") do
    (table.insert)(l_2_1, l_2_5)
  end
  return l_2_1
end

            local l_0_10 = {SIG_CONTEXT = "BM", CONTENT_SOURCE = "SUSTASKS-Ps", PROCESS_CONTEXT = "powershell.exe", FILELESS = "true", CMDLINE_URL = "true"}
            for l_0_14,l_0_15 in ipairs(l_0_8(l_0_7)) do
              local l_0_11 = nil
              -- DECOMPILER ERROR at PC157: Confused about usage of register: R9 in 'UnsetPending'

              for l_0_20,l_0_21 in ipairs(l_0_9(R9_PC157)) do
                local l_0_17 = nil
                -- DECOMPILER ERROR at PC165: Confused about usage of register: R15 in 'UnsetPending'

                if (string.match)(R15_PC165, "^https?://") then
                  local l_0_23 = SafeGetUrlReputation
                  l_0_23 = l_0_23({l_0_22}, l_0_10, false, 3000)
                  if (l_0_23.urls)[l_0_22] and ((l_0_23.urls)[l_0_22]).determination == 2 and ((l_0_23.urls)[l_0_22]).confidence >= 60 then
                    return mp.INFECTED
                  end
                end
              end
            end
          end
          do
            l_0_8 = mp
            l_0_8 = l_0_8.CLEAN
            return l_0_8
          end
        end
      end
    end
  end
end

