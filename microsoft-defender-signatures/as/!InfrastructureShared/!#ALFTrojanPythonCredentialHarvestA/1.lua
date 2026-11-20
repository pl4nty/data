-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Python/CredentialHarvest.A
-- Type: 24
-- MpAttributes: (SCPT:PyCredHarvest.ReadStream | SCPT:PyCredHarvest.ReadPath) & (SCPT:PyCredHarvest.EnvEnum | SCPT:PyCredHarvest.ProcEnv | SCPT:PyCredHarvest.Discovery)

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local function r0_0(p1_0)
  return mp.get_mpattribute("SCPT:PyCredHarvest." .. p1_0)
end

local r0_1 = r0_0("ReadPath") or r0_0("FileOpen") and r0_0("ReadStream")
if r0_1 then
  local function r0_2(p2_0)
    local r2_0 = 0
    for r2_1, r2_2 in ipairs(p2_0) do
      if r0_0(r2_2) then
        r2_0 = r2_0 + 1
      end
    end
    return r2_0
  end

  local r0_3 = r0_2
  r0_3 = r0_3({
      "CloudStore", "CIStore", "PackageStore", "VcsStore", "ContainerStore", "AIStore", "SshStore"
    })
  if r0_3 < 2 then
    return mp.CLEAN
  end
  local r0_4 = r0_2
  r0_4 = r0_4({ "CloudToken", "CIToken", "VcsToken", "PackageToken", "AIToken" })
  local r0_5 = r0_2
  r0_5 = r0_5({
      "SecretToken", "SecretSecret", "SecretPassword", "SecretCredential", "SecretApiKey"
    })
  local r0_6 = r0_0
  r0_6 = r0_6("EnvEnum")
  r0_6 = r0_6 and (r0_5 >= 2 or r0_4 >= 2)
  local r0_7 = r0_0
  r0_7 = r0_7("ProcEnv")
  local r0_8 = r0_0
  r0_8 = r0_8("Discovery")
  local r0_9 = r0_0
  r0_9 = r0_9("HttpPost")
  local r0_10 = r0_0
  r0_10 = r0_10("HttpRequest") or r0_9
  local r0_11 = r0_10 and r0_0("HttpBody") and (r0_9 or r0_0("HttpUpload"))
  if not r0_6 and not r0_7 and (not r0_8 or not (r0_3 >= 3) or not (r0_4 >= 2) or not r0_11) then
    return mp.CLEAN
  end
  local r0_12 = 2 * r0_3
  r0_12 = r0_12 > 8 and 8 or r0_12
  local r0_13 = r0_4
  r0_13 = r0_13 > 3 and 3 or r0_13
  local r0_14 = r0_12 + r0_13
  if r0_7 then
    r0_14 = r0_14 + 4
  elseif r0_6 then
    r0_14 = r0_14 + 3
  end
  if r0_8 then
    r0_14 = r0_14 + 1
  end
  if r0_10 and r0_0("IdentityEndpoint") then
    r0_14 = r0_14 + 2
  end
  if r0_11 then
    r0_14 = r0_14 + 2
  end
  local r0_15 = r0_0
  r0_15 = r0_15("Serialize")
  if r0_15 then
    r0_14 = r0_14 + 1
  end
  if r0_14 < 12 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
