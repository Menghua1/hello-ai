variable "location" {
  type = string
}

variable "environment_name" {
  description = "The name of the azd environment to be deployed"
  type        = string
}

variable "principal_id" {
  description = "The Id of the azd service principal to add to deployed keyvault access policies"
  type        = string
  default     = ""
}

variable "workspace" {
  description = "value of workspace"
  type        = string
  default     = "dev"
}

variable "openai_model_name" {
  description = "value of azure openai model name"
  type        = string
  default     = "gpt-35-turbo"
}

variable "openai_model_version" {
  description = "value of azure openai model version"
  type        = string
  default     = "0613"
}

variable "openai_model_capacity" {
  description = "value of azure openai model capacity"
  type        = number
  default     = 30
}

variable "openai_embeddings_model_name" {
  description = "value of azure openai embeddings model name"
  type        = string
  default     = "text-embedding-ada-002"
}

variable "openai_embeddings_model_version" {
  description = "value of azure openai embeddings model version"
  type        = string
  default     = "2"
}

variable "openai_embeddings_model_capacity" {
  description = "value of azure openai embeddings model capacity"
  type        = number
  default     = 30
}

variable "k8s_namespace" {
  description = "value of kubernetes namespace"
  type        = string
  default     = "default"
}

variable "search_index_name" {
  description = "value of search index name"
  type        = string
  default     = "docs"
}
