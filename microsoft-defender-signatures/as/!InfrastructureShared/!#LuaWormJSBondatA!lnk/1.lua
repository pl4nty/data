-- Threat: !InfrastructureShared
-- Name: !#/Lua:Worm:JS/Bondat.A!lnk
-- Type: 13

function string_starts(l_1_0, l_1_1)
  return string.sub(l_1_0, 1, string.len(l_1_1)) == l_1_1
end

if mp.get_mpattribute("SCRIPT:Worm:JS/Bondat.A!lnk") then
  if mp.readu_u32(headerpage, 1) ~= 76 then
    return mp.CLEAN
  end
  local l_0_0 = string.lower(tostring(headerpage))
  local l_0_1 = string.match(l_0_0, "\\appdata\\roaming\\%w+\\(%w+%.exe)%z")
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = {
    "win",
    "cmd",
    "disk",
    "dsk",
    "ms",
    "hp",
    "intel",
    "amd",
    "dll",
    "tcp",
    "udp"
  }
  local l_0_3 = {
    "process",
    "proc",
    "monitor",
    "mon",
    "sys",
    "host",
    "mgr",
    "update",
    "updater"
  }
  local l_0_4 = {
    "64.exe",
    "32.exe",
    ".exe"
  }
  local l_0_5 = #l_0_2
  local l_0_6 = #l_0_3
  local l_0_7 = #l_0_4
  for l_0_8 = 1, l_0_5 do
    if string_starts(l_0_1, l_0_2[l_0_8]) then
      for l_0_9 = 1, l_0_6 do
        if string_starts(string.sub(l_0_1, string.len(l_0_2[l_0_8]) + 1), l_0_3[l_0_9]) then
          for l_0_10 = 1, l_0_7 do
            if string.sub(l_0_1, string.len(l_0_2[l_0_8]) + string.len(l_0_3[l_0_9]) + 1) == l_0_4[l_0_10] then
              local l_0_11 = string.lower(mp.getfilename())
              if string.find(l_0_11, "windows explorer%.lnk") then
                return mp.INFECTED
              end
              return mp.LOWFI
            end
          end
        end
      end
    end
  end
  return mp.LOWFI
end
return mp.CLEAN
