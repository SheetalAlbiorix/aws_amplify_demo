/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Organizations type in your schema. */
@immutable
class Organizations extends Model {
  static const classType = const _OrganizationsModelType();
  final String id;
  final String? _type;
  final String? _teamSize;
  final String? _name;
  final OrganizationsStructureEnum? _organizationStructure;
  final String? _chapterName;
  final String? _oraganizationFunction;
  final String? _shortDescription;
  final String? _longDescription;
  final int? _estimatedAnnualBudget;
  final OrganizationImpactEnum? _organizationImpact;
  final String? _contactFullName;
  final String? _contactEmail;
  final String? _contactPhoneNumber;
  final String? _contactRole;
  final bool? _isActive;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get type {
    try {
      return _type!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get teamSize {
    try {
      return _teamSize!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  OrganizationsStructureEnum get organizationStructure {
    try {
      return _organizationStructure!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get chapterName {
    return _chapterName;
  }
  
  String get oraganizationFunction {
    try {
      return _oraganizationFunction!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get shortDescription {
    try {
      return _shortDescription!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get longDescription {
    return _longDescription;
  }
  
  int get estimatedAnnualBudget {
    try {
      return _estimatedAnnualBudget!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  OrganizationImpactEnum get organizationImpact {
    try {
      return _organizationImpact!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get contactFullName {
    try {
      return _contactFullName!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get contactEmail {
    try {
      return _contactEmail!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get contactPhoneNumber {
    try {
      return _contactPhoneNumber!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get contactRole {
    try {
      return _contactRole!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get isActive {
    try {
      return _isActive!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Organizations._internal({required this.id, required type, required teamSize, required name, required organizationStructure, chapterName, required oraganizationFunction, required shortDescription, longDescription, required estimatedAnnualBudget, required organizationImpact, required contactFullName, required contactEmail, required contactPhoneNumber, required contactRole, required isActive, createdAt, updatedAt}): _type = type, _teamSize = teamSize, _name = name, _organizationStructure = organizationStructure, _chapterName = chapterName, _oraganizationFunction = oraganizationFunction, _shortDescription = shortDescription, _longDescription = longDescription, _estimatedAnnualBudget = estimatedAnnualBudget, _organizationImpact = organizationImpact, _contactFullName = contactFullName, _contactEmail = contactEmail, _contactPhoneNumber = contactPhoneNumber, _contactRole = contactRole, _isActive = isActive, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Organizations({String? id, required String type, required String teamSize, required String name, required OrganizationsStructureEnum organizationStructure, String? chapterName, required String oraganizationFunction, required String shortDescription, String? longDescription, required int estimatedAnnualBudget, required OrganizationImpactEnum organizationImpact, required String contactFullName, required String contactEmail, required String contactPhoneNumber, required String contactRole, required bool isActive}) {
    return Organizations._internal(
      id: id == null ? UUID.getUUID() : id,
      type: type,
      teamSize: teamSize,
      name: name,
      organizationStructure: organizationStructure,
      chapterName: chapterName,
      oraganizationFunction: oraganizationFunction,
      shortDescription: shortDescription,
      longDescription: longDescription,
      estimatedAnnualBudget: estimatedAnnualBudget,
      organizationImpact: organizationImpact,
      contactFullName: contactFullName,
      contactEmail: contactEmail,
      contactPhoneNumber: contactPhoneNumber,
      contactRole: contactRole,
      isActive: isActive);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Organizations &&
      id == other.id &&
      _type == other._type &&
      _teamSize == other._teamSize &&
      _name == other._name &&
      _organizationStructure == other._organizationStructure &&
      _chapterName == other._chapterName &&
      _oraganizationFunction == other._oraganizationFunction &&
      _shortDescription == other._shortDescription &&
      _longDescription == other._longDescription &&
      _estimatedAnnualBudget == other._estimatedAnnualBudget &&
      _organizationImpact == other._organizationImpact &&
      _contactFullName == other._contactFullName &&
      _contactEmail == other._contactEmail &&
      _contactPhoneNumber == other._contactPhoneNumber &&
      _contactRole == other._contactRole &&
      _isActive == other._isActive;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Organizations {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("type=" + "$_type" + ", ");
    buffer.write("teamSize=" + "$_teamSize" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("organizationStructure=" + (_organizationStructure != null ? enumToString(_organizationStructure)! : "null") + ", ");
    buffer.write("chapterName=" + "$_chapterName" + ", ");
    buffer.write("oraganizationFunction=" + "$_oraganizationFunction" + ", ");
    buffer.write("shortDescription=" + "$_shortDescription" + ", ");
    buffer.write("longDescription=" + "$_longDescription" + ", ");
    buffer.write("estimatedAnnualBudget=" + (_estimatedAnnualBudget != null ? _estimatedAnnualBudget!.toString() : "null") + ", ");
    buffer.write("organizationImpact=" + (_organizationImpact != null ? enumToString(_organizationImpact)! : "null") + ", ");
    buffer.write("contactFullName=" + "$_contactFullName" + ", ");
    buffer.write("contactEmail=" + "$_contactEmail" + ", ");
    buffer.write("contactPhoneNumber=" + "$_contactPhoneNumber" + ", ");
    buffer.write("contactRole=" + "$_contactRole" + ", ");
    buffer.write("isActive=" + (_isActive != null ? _isActive!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Organizations copyWith({String? id, String? type, String? teamSize, String? name, OrganizationsStructureEnum? organizationStructure, String? chapterName, String? oraganizationFunction, String? shortDescription, String? longDescription, int? estimatedAnnualBudget, OrganizationImpactEnum? organizationImpact, String? contactFullName, String? contactEmail, String? contactPhoneNumber, String? contactRole, bool? isActive}) {
    return Organizations._internal(
      id: id ?? this.id,
      type: type ?? this.type,
      teamSize: teamSize ?? this.teamSize,
      name: name ?? this.name,
      organizationStructure: organizationStructure ?? this.organizationStructure,
      chapterName: chapterName ?? this.chapterName,
      oraganizationFunction: oraganizationFunction ?? this.oraganizationFunction,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      estimatedAnnualBudget: estimatedAnnualBudget ?? this.estimatedAnnualBudget,
      organizationImpact: organizationImpact ?? this.organizationImpact,
      contactFullName: contactFullName ?? this.contactFullName,
      contactEmail: contactEmail ?? this.contactEmail,
      contactPhoneNumber: contactPhoneNumber ?? this.contactPhoneNumber,
      contactRole: contactRole ?? this.contactRole,
      isActive: isActive ?? this.isActive);
  }
  
  Organizations.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _type = json['type'],
      _teamSize = json['teamSize'],
      _name = json['name'],
      _organizationStructure = enumFromString<OrganizationsStructureEnum>(json['organizationStructure'], OrganizationsStructureEnum.values),
      _chapterName = json['chapterName'],
      _oraganizationFunction = json['oraganizationFunction'],
      _shortDescription = json['shortDescription'],
      _longDescription = json['longDescription'],
      _estimatedAnnualBudget = (json['estimatedAnnualBudget'] as num?)?.toInt(),
      _organizationImpact = enumFromString<OrganizationImpactEnum>(json['organizationImpact'], OrganizationImpactEnum.values),
      _contactFullName = json['contactFullName'],
      _contactEmail = json['contactEmail'],
      _contactPhoneNumber = json['contactPhoneNumber'],
      _contactRole = json['contactRole'],
      _isActive = json['isActive'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'type': _type, 'teamSize': _teamSize, 'name': _name, 'organizationStructure': enumToString(_organizationStructure), 'chapterName': _chapterName, 'oraganizationFunction': _oraganizationFunction, 'shortDescription': _shortDescription, 'longDescription': _longDescription, 'estimatedAnnualBudget': _estimatedAnnualBudget, 'organizationImpact': enumToString(_organizationImpact), 'contactFullName': _contactFullName, 'contactEmail': _contactEmail, 'contactPhoneNumber': _contactPhoneNumber, 'contactRole': _contactRole, 'isActive': _isActive, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField TEAMSIZE = QueryField(fieldName: "teamSize");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField ORGANIZATIONSTRUCTURE = QueryField(fieldName: "organizationStructure");
  static final QueryField CHAPTERNAME = QueryField(fieldName: "chapterName");
  static final QueryField ORAGANIZATIONFUNCTION = QueryField(fieldName: "oraganizationFunction");
  static final QueryField SHORTDESCRIPTION = QueryField(fieldName: "shortDescription");
  static final QueryField LONGDESCRIPTION = QueryField(fieldName: "longDescription");
  static final QueryField ESTIMATEDANNUALBUDGET = QueryField(fieldName: "estimatedAnnualBudget");
  static final QueryField ORGANIZATIONIMPACT = QueryField(fieldName: "organizationImpact");
  static final QueryField CONTACTFULLNAME = QueryField(fieldName: "contactFullName");
  static final QueryField CONTACTEMAIL = QueryField(fieldName: "contactEmail");
  static final QueryField CONTACTPHONENUMBER = QueryField(fieldName: "contactPhoneNumber");
  static final QueryField CONTACTROLE = QueryField(fieldName: "contactRole");
  static final QueryField ISACTIVE = QueryField(fieldName: "isActive");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Organizations";
    modelSchemaDefinition.pluralName = "Organizations";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PRIVATE,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.TYPE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.TEAMSIZE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.ORGANIZATIONSTRUCTURE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.CHAPTERNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.ORAGANIZATIONFUNCTION,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.SHORTDESCRIPTION,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.LONGDESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.ESTIMATEDANNUALBUDGET,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.ORGANIZATIONIMPACT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.CONTACTFULLNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.CONTACTEMAIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.CONTACTPHONENUMBER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.CONTACTROLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Organizations.ISACTIVE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _OrganizationsModelType extends ModelType<Organizations> {
  const _OrganizationsModelType();
  
  @override
  Organizations fromJson(Map<String, dynamic> jsonData) {
    return Organizations.fromJson(jsonData);
  }
}