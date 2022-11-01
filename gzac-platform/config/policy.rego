package opa.test

user_role_policy = response {
    input.name
    response := {
        "roles": UserRoles
    }
}

UserRoles = resp {
    input.name = "garrus"
    resp := ["tech", "crew"]
}

UserRoles = resp {
    input.name = "shepard"
    resp := ["commander", "crew"]
}

document_search_filter = { "createdBy": [ createdBy ] } {
    [_, payload, _] := io.jwt.decode(input.token)
    createdBy := payload.email
}