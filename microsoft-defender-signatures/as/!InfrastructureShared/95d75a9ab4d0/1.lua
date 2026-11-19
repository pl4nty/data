-- Threat: !InfrastructureShared
-- Name: 95d75a9ab4d0
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.GetScannedPPID()
if type(r0_0) == "string" and r0_0 ~= "" then
  local r0_1 = mp.GetProcessCommandLine(r0_0)
  if type(r0_1) == "string" and not (#r0_1 < 500) and not (#r0_1 > 3000) then
    local r0_2 = MpCommon.GetImagePathFromPid(r0_0)
    if type(r0_2) == "string" then
      local r0_3 = string.match(string.lower(r0_2), "([^\\]+)$")
      local r0_4 = { ["conhost.exe"] = true, ["cmd.exe"] = true }
      if r0_3 and r0_4[r0_3] then
        local r0_5 = mp.GetParentProcInfo()
        if type(r0_5) == "table" and type(r0_5.image_path) == "string" then
          local r0_6 = {
            ["chrome.exe"] = true, ["msedge.exe"] = true, ["firefox.exe"] = true,
            ["brave.exe"] = true, ["opera.exe"] = true, ["vivaldi.exe"] = true
          }
          local r0_7 = r0_6[string.match(string.lower(r0_5.image_path), "([^\\]+)$")]
          if r0_7 then
            local r0_8 = string.lower(r0_1)
            local r0_9 = string.gsub(r0_8, "%s+", "")
            local r0_10 = string.find
            local r0_11 = r0_10
            r0_11 = (r0_11(r0_9, "gci", 1, true) or r0_10(r0_9, "get-childitem", 1, true))
              and (r0_10(r0_9, "-r-file", 1, true) or r0_10(r0_9, "-recurse-file", 1, true))
              and (r0_10(r0_9, "-easilentlycontinue", 1, true)
                or r0_10(r0_9, "-erroractionsilentlycontinue", 1, true))
            local r0_12 = r0_10
            r0_12 = r0_12(r0_9, "[io.file]::readallbytes(", 1, true)
              or r0_10(r0_9, "[system.io.file]::readallbytes(", 1, true)
            local r0_13 = r0_10
            r0_13 = r0_13(r0_9, "[io.file]::openread(", 1, true)
              or r0_10(r0_9, "[system.io.file]::openread(", 1, true)
            local r0_14 = r0_13
              and string.match(r0_9, "%.seek%(%-%d+,2%)") ~= nil
              and r0_10(r0_9, ".read(", 1, true)
            if r0_11 and (r0_14 or r0_12) then
              return mp.INFECTED
            end
            return mp.CLEAN
          end
          return mp.CLEAN
        end
        return mp.CLEAN
      end
      return mp.CLEAN
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
