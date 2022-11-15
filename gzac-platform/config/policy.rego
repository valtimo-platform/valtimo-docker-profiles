package opa.test

document_search_filter = { "createdBy": [ createdBy ] } {
    [_, payload, _] := io.jwt.decode(input.token)
    createdBy := payload.email
}


default document_feature = false

document_feature = result {
    input.data.feature = "view"
    result := true
}

document_feature = result {
    input.data.feature = "create"
    input.data.documentDefinitionName = "bezwaar"

    [_, payload, _] := io.jwt.decode(input.token)
    result := containsIn(payload.realm_access.roles, "ROLE_ADMIN")
}

containsIn(roles, role) {
    roles[_] = role
}