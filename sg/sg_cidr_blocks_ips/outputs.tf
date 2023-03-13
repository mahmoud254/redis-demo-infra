output security_group_id {
    value = aws_security_group.my_sg.id
}

output security_group_arn {
    value = aws_security_group.my_sg.arn
}
