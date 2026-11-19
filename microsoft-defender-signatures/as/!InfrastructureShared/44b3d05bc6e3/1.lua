-- Threat: !InfrastructureShared
-- Name: 44b3d05bc6e3
-- Type: 21

local function l_0_0(l_1_0, l_1_1, l_1_2)
  local l_1_3 = 0
  
  local l_1_4 = {}
  while l_1_2 > l_1_3 do
    l_1_4[#l_1_4 + 1] = string.char(string.byte(l_1_0, l_1_1 + l_1_3))
    l_1_3 = l_1_3 + 2
  end
  return (table.concat(l_1_4, ""))
end

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_1 = {
    ucbrowserupdatercore = true,
    hpceescheduleforwalk2 = true,
    hpceescheduleforhp = true,
    ["hpceescheduleforbid-n-buy"] = true,
    hpceescheduleformajas = true,
    dropboxupdatetaskmachineua = true,
    ["adobe flash player updater"] = true,
    ["msi task host - ledkeeper2_host"] = true,
    ss1collectservertask = true
  }
  local l_0_2 = 0
  local l_0_3 = string.lower(this_sigattrlog[1].utf8p1)
  local l_0_4 = string.match(l_0_3, "([^\\]+)$")
  l_0_4 = string.match(l_0_4, "(.-[^%.]+)")
  local l_0_5 = ""
  if 0 < #l_0_4 and l_0_4 then
    if l_0_1[l_0_4] == true then
      return mp.CLEAN
    end
    l_0_5 = "job:" .. l_0_4 .. ";"
    local l_0_6 = "HKLM\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\Taskcache\\Tree\\" .. l_0_4
    local l_0_7 = sysio.RegOpenKey(l_0_6)
    if l_0_7 then
      local l_0_8 = sysio.GetRegValueAsString(l_0_7, "Id")
      if l_0_8 ~= nil then
        local l_0_9 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tasks\\" .. l_0_8
        local l_0_10 = sysio.RegOpenKey(l_0_9)
        if l_0_10 then
          local l_0_11 = sysio.GetRegValueAsBinary(l_0_10, "Actions")
          if l_0_11 and 0 < #l_0_11 then
            local l_0_12 = 1
            local l_0_13 = mp.readu_u16(l_0_11, l_0_12)
            l_0_12 = l_0_12 + 2
            if 3 < l_0_13 then
              return mp.CLEAN
            end
            if l_0_13 == 3 then
              l_0_2 = l_0_2 + 1
            end
            local l_0_14 = mp.readu_u32(l_0_11, l_0_12)
            l_0_12 = l_0_12 + 4
            local l_0_15, l_0_16 = pcall(l_0_0, l_0_11, l_0_12, l_0_14)
            if not l_0_15 then
              return mp.CLEAN
            end
            l_0_12 = l_0_12 + l_0_14
            l_0_5 = l_0_5 .. "m_content:" .. l_0_16 .. ";"
            if l_0_16 == "Author" then
              l_0_2 = l_0_2 + 1
            end
            while l_0_12 < #l_0_11 - 1 do
              local l_0_17 = mp.readu_u16(l_0_11, l_0_12)
              l_0_12 = l_0_12 + 2
              if 26214 == l_0_17 then
                l_0_12 = l_0_12 + 4
                local l_0_18 = mp.readu_u32(l_0_11, l_0_12)
                l_0_12 = l_0_12 + 4
                if 0 < l_0_18 then
                  local l_0_19, l_0_20 = pcall(l_0_0, l_0_11, l_0_12, l_0_18)
                  if not l_0_19 then
                    return mp.CLEAN
                  end
                  l_0_12 = l_0_12 + l_0_18
                  if l_0_20 then
                    l_0_5 = l_0_5 .. "m_path:" .. l_0_20 .. ";"
                    if l_0_2 == 2 then
                      local l_0_21 = sysio.GetProcessFromFileName(l_0_20)
                      for l_0_22, l_0_23 in pairs(l_0_21) do
                        local l_0_24 = string.format("pid:%d,ProcessStart:%u", l_0_23.pid, l_0_23.starttime)
                        if l_0_24 then
                          bm.request_SMS(l_0_24, "m")
                          bm.add_action("SmsAsyncScanEvent", 1)
                        end
                      end
                    end
                  end
                end
                local l_0_25 = mp.readu_u32(l_0_11, l_0_12)
                l_0_12 = l_0_12 + 4
                if 0 < l_0_25 then
                  local l_0_26, l_0_27 = pcall(l_0_0, l_0_11, l_0_12, l_0_25)
                  if not l_0_26 then
                    return mp.CLEAN
                  end
                  l_0_12 = l_0_12 + l_0_25
                  l_0_5 = l_0_5 .. "m_argument:" .. l_0_27 .. ";"
                end
                local l_0_28 = mp.readu_u32(l_0_11, l_0_12)
                l_0_12 = l_0_12 + 4
                if 0 < l_0_28 then
                  local l_0_29, l_0_30 = pcall(l_0_0, l_0_11, l_0_12, l_0_28)
                  if not l_0_29 then
                    return mp.CLEAN
                  end
                  l_0_12 = l_0_12 + l_0_28
                  l_0_5 = l_0_5 .. "m_workingDir:" .. l_0_30 .. ";"
                end
                l_0_5 = l_0_5 .. "weight:" .. l_0_2 .. ";"
                mp.set_mpattribute(string.format("MpInternal_researchdata=TaskInfo=%s", l_0_5))
              end
            end
            if l_0_2 == 2 then
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
