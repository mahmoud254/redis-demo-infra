
resource "aws_ecr_repository" "backend" {
    name                 = "${var.ecr_name}-${var.env}"
    image_tag_mutability = "MUTABLE"
}


resource "aws_ecr_lifecycle_policy" "backend_policy" {
    repository = aws_ecr_repository.backend.name
    policy = <<EOF
    {
    "rules" : [{
        "rulePriority" : 1,
        "description"  : "keep last 10 images",
        "action"       : {
        "type" : "expire"
        },
        "selection"     : {
        "tagStatus"   : "any",
        "countType"   : "imageCountMoreThan",
        "countNumber" : 10
        }
    }]}
    EOF
}
    